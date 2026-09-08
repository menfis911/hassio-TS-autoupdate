#!/usr/bin/with-contenv bashio
set -euo pipefail

TS_PORT=$(bashio::config port)
TS_SSL_PORT=$(bashio::config ssl_port)
TS_INTERNAL_PORT=18090
TS_RESTART_COUNT=0

mkdir -p /config /config/torrents /run/nginx

FLAGS="--path /config --torrentsdir /config/torrents --port ${TS_INTERNAL_PORT}"

if [[ "$(bashio::config httpauth)" = true ]]; then
  FLAGS="${FLAGS} --httpauth"
  jq_args=(-n)
  for key in $(bashio::config 'logins|keys'); do
    USERNAME=$(bashio::config "logins[${key}].username")
    PASSWORD=$(bashio::config "logins[${key}].password")
    jq_args+=(--arg "${USERNAME}" "${PASSWORD}")
  done
  jq "${jq_args[@]}" '$ARGS.named' > /config/accs.db
fi

if [[ -n "$(bashio::config tgtoken)" ]]; then
  FLAGS="${FLAGS} --tg=$(bashio::config tgtoken)"
fi

if [[ -n "$(bashio::config m3u_custom_host)" ]]; then
  export M3U_CUSTOM_HOST="$(bashio::config m3u_custom_host)"
fi

if [[ "$(bashio::config weblog)" = true ]]; then
  FLAGS="${FLAGS} --weblogpath /dev/stdout"
fi

if [[ "$(bashio::config ssl)" = true ]]; then
  FLAGS="${FLAGS} --ssl --sslport ${TS_SSL_PORT}"
  SSL_CERT=$(bashio::config ssl_cert)
  SSL_KEY=$(bashio::config ssl_key)
  [[ -n "${SSL_CERT}" ]] && FLAGS="${FLAGS} --sslcert ${SSL_CERT}"
  [[ -n "${SSL_KEY}" ]] && FLAGS="${FLAGS} --sslkey ${SSL_KEY}"
fi

if [[ "$(bashio::config proxymode)" != disabled ]]; then
  PROXY_MODE=$(bashio::config proxymode)
  PROXY_URL=$(bashio::config proxyurl)
  [[ -n "${PROXY_URL}" ]] || bashio::exit.nok
  FLAGS="${FLAGS} --proxyurl=${PROXY_URL} --proxymode=${PROXY_MODE}"
fi

cat > /run/nginx/nginx.conf <<EOF
worker_processes 1;
pid /run/nginx/nginx.pid;
error_log /dev/stderr warn;

events {
    worker_connections 1024;
}

http {
    map \$http_upgrade \$connection_upgrade {
        default upgrade;
        '' close;
    }

    server {
        listen ${TS_PORT};
        server_name _;

        location = /ui {
            return 301 /ui/;
        }

        location /ui/ {
            proxy_pass http://127.0.0.1:${TS_INTERNAL_PORT}/;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Host \$host;
            proxy_set_header X-Forwarded-Proto \$scheme;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection \$connection_upgrade;
            proxy_read_timeout 3600s;
            proxy_send_timeout 3600s;
            proxy_buffering off;
        }

        location / {
            proxy_pass http://127.0.0.1:${TS_INTERNAL_PORT};
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Host \$host;
            proxy_set_header X-Forwarded-Proto \$scheme;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection \$connection_upgrade;
            proxy_read_timeout 3600s;
            proxy_send_timeout 3600s;
            proxy_buffering off;
        }
    }
}
EOF

start_torrserver() {
  bashio::log.info "Starting TorrServer on internal HTTP port ${TS_INTERNAL_PORT}"
  /usr/bin/torrserver ${FLAGS} &
  TS_PID=$!
  sleep 2

  local version_response
  if version_response="$(curl -fsS --max-time 3 "http://127.0.0.1:${TS_INTERNAL_PORT}/echo" 2>/dev/null)"; then
    bashio::log.info "TorrServer healthcheck: OK (version: ${version_response})"
  else
    bashio::log.warning "TorrServer started, but healthcheck is not ready yet"
  fi
}

restart_torrserver() {
  TS_RESTART_COUNT=$((TS_RESTART_COUNT + 1))
  bashio::log.warning "TorrServer healthcheck failed; restarting TorrServer (restart #${TS_RESTART_COUNT})"

  kill "${TS_PID}" 2>/dev/null || true
  wait "${TS_PID}" 2>/dev/null || true

  start_torrserver
}

if [[ "$(bashio::config ssl)" = true ]]; then
  bashio::log.info "TorrServer HTTPS is enabled on port ${TS_SSL_PORT}"
fi
bashio::log.info "Starting Home Assistant web proxy on port ${TS_PORT}"

TS_PID=0
start_torrserver

health_monitor_loop() {
  local failures=0
  local response

  while true; do
    if ! kill -0 "${TS_PID}" 2>/dev/null; then
      bashio::log.warning "TorrServer process is not running; starting it again"
      start_torrserver
      failures=0
      sleep 5
      continue
    fi

    if response="$(curl -fsS --max-time 3 "http://127.0.0.1:${TS_INTERNAL_PORT}/echo" 2>/dev/null)"; then
      if (( failures > 0 )); then
        bashio::log.info "TorrServer healthcheck recovered (version: ${response})"
      fi
      failures=0
    else
      failures=$((failures + 1))
      bashio::log.warning "TorrServer healthcheck failed (${failures}/3)"
      if (( failures >= 3 )); then
        restart_torrserver
        failures=0
      fi
    fi

    sleep 10
  done
}

publish_mqtt() {
  local topic="$1"
  local payload="$2"
  mosquitto_pub "${MQTT_ARGS[@]}" -r -t "${topic}" -m "${payload}" >/dev/null 2>&1
}

publish_mqtt_discovery() {
  local base="$1"
  local device='{"identifiers":["torrserver_autoupdate"],"name":"TorrServer","manufacturer":"menfis911","model":"TorrServer AutoUpdate"}'

  publish_mqtt "${base}/binary_sensor/status/config" "{\"name\":\"Status\",\"unique_id\":\"torrserver_status\",\"state_topic\":\"${base}/status\",\"payload_on\":\"online\",\"payload_off\":\"offline\",\"device\":${device}}" && \
  publish_mqtt "${base}/sensor/version/config" "{\"name\":\"Version\",\"unique_id\":\"torrserver_version\",\"state_topic\":\"${base}/version\",\"icon\":\"mdi:information-outline\",\"device\":${device}}" && \
  publish_mqtt "${base}/sensor/torrents/config" "{\"name\":\"Torrents\",\"unique_id\":\"torrserver_torrents\",\"state_topic\":\"${base}/torrents\",\"unit_of_measurement\":\"torrents\",\"state_class\":\"measurement\",\"icon\":\"mdi:download-multiple\",\"device\":${device}}" && \
  publish_mqtt "${base}/sensor/storage_free/config" "{\"name\":\"Storage free\",\"unique_id\":\"torrserver_storage_free\",\"state_topic\":\"${base}/storage_free\",\"unit_of_measurement\":\"GB\",\"device_class\":\"data_size\",\"state_class\":\"measurement\",\"icon\":\"mdi:harddisk\",\"device\":${device}}" && \
  publish_mqtt "${base}/sensor/restarts/config" "{\"name\":\"Restarts\",\"unique_id\":\"torrserver_restarts\",\"state_topic\":\"${base}/restarts\",\"unit_of_measurement\":\"restarts\",\"state_class\":\"total_increasing\",\"icon\":\"mdi:restart\",\"device\":${device}}"
}

mqtt_metrics_loop() {
  if ! bashio::config.true mqtt_discovery; then
    bashio::log.info "MQTT discovery sensors are disabled"
    return 0
  fi

  local base="homeassistant/torrserver"
  local echo_response torrent_count free_kb free_gb auth_args=()
  local mqtt_host mqtt_port mqtt_user mqtt_password mqtt_ssl
  local mqtt_connected=false
  local mqtt_failures=0

  while true; do
    if ! bashio::services.available "mqtt"; then
      if (( mqtt_failures == 0 || mqtt_failures % 4 == 0 )); then
        bashio::log.warning "MQTT service is not available yet; retrying"
      fi
      mqtt_failures=$((mqtt_failures + 1))
      sleep 15
      continue
    fi

    mqtt_host="$(bashio::services mqtt "host" 2>/dev/null || true)"
    mqtt_port="$(bashio::services mqtt "port" 2>/dev/null || true)"
    mqtt_user="$(bashio::services mqtt "username" 2>/dev/null || true)"
    mqtt_password="$(bashio::services mqtt "password" 2>/dev/null || true)"
    mqtt_ssl="$(bashio::services mqtt "ssl" 2>/dev/null || true)"

    if [[ -z "${mqtt_host}" || -z "${mqtt_port}" ]]; then
      if (( mqtt_failures == 0 || mqtt_failures % 4 == 0 )); then
        bashio::log.warning "MQTT service was found, but connection details are unavailable; retrying"
      fi
      mqtt_failures=$((mqtt_failures + 1))
      sleep 15
      continue
    fi

    MQTT_ARGS=(-h "${mqtt_host}" -p "${mqtt_port}" -q 1)
    [[ -n "${mqtt_user}" ]] && MQTT_ARGS+=(-u "${mqtt_user}")
    [[ -n "${mqtt_password}" ]] && MQTT_ARGS+=(-P "${mqtt_password}")
    [[ "${mqtt_ssl}" = true ]] && MQTT_ARGS+=(--insecure)

    if ! publish_mqtt "${base}/status" "online"; then
      if [[ "${mqtt_connected}" = true || ${mqtt_failures} -eq 0 || $((mqtt_failures % 4)) -eq 0 ]]; then
        bashio::log.warning "MQTT broker connection failed; retrying"
      fi
      mqtt_connected=false
      mqtt_failures=$((mqtt_failures + 1))
      sleep 15
      continue
    fi

    mqtt_failures=0
    if [[ "${mqtt_connected}" != true ]]; then
      bashio::log.info "MQTT connected: ${mqtt_host}:${mqtt_port}"
    fi

    if ! publish_mqtt_discovery "${base}"; then
      bashio::log.warning "MQTT Discovery publish failed; will retry"
      mqtt_connected=false
      sleep 15
      continue
    fi

    if [[ "${mqtt_connected}" != true ]]; then
      bashio::log.info "MQTT Discovery published for TorrServer"
    fi
    mqtt_connected=true

    if bashio::config.true httpauth; then
      local first_login first_password
      first_login="$(bashio::config 'logins[0].username')"
      first_password="$(bashio::config 'logins[0].password')"
      auth_args=(-u "${first_login}:${first_password}")
    fi

    if echo_response="$(curl -fsS --max-time 3 "http://127.0.0.1:${TS_INTERNAL_PORT}/echo" 2>/dev/null)"; then
      publish_mqtt "${base}/status" "online" || true
      publish_mqtt "${base}/version" "${echo_response}" || true
      publish_mqtt "${base}/restarts" "${TS_RESTART_COUNT}" || true

      if torrent_count="$(curl -fsS --max-time 5 "${auth_args[@]}" -H 'Content-Type: application/json' -d '{"action":"list"}' "http://127.0.0.1:${TS_INTERNAL_PORT}/torrents" 2>/dev/null | jq 'length' 2>/dev/null)"; then
        publish_mqtt "${base}/torrents" "${torrent_count}" || true
      fi

      if free_kb="$(df -Pk /config 2>/dev/null | awk 'NR==2 {print $4}')" && [[ "${free_kb}" =~ ^[0-9]+$ ]]; then
        free_gb="$(awk -v kb="${free_kb}" 'BEGIN {printf "%.2f", kb/1024/1024}')"
        publish_mqtt "${base}/storage_free" "${free_gb}" || true
      fi
    else
      publish_mqtt "${base}/status" "offline" || true
    fi

    sleep 15
  done
}

MQTT_ARGS=()
health_monitor_loop &
HEALTH_PID=$!
mqtt_metrics_loop &
MQTT_PID=$!

cleanup() {
  kill "${MQTT_PID}" 2>/dev/null || true
  kill "${HEALTH_PID}" 2>/dev/null || true
  kill "${TS_PID}" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

nginx -c /run/nginx/nginx.conf -g 'daemon off;'
