#!/usr/bin/with-contenv bashio
set -euo pipefail

TS_PORT=$(bashio::config port)
TS_SSL_PORT=$(bashio::config ssl_port)
TS_INTERNAL_PORT=18090

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

        # Home Assistant Ingress enters the add-on at /ui. TorrServer's
        # frontend is built for relative API paths, so keep the /ui prefix
        # in the browser URL and strip it before proxying to TorrServer.
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

        # Direct LAN access keeps the normal TorrServer root URL.
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

bashio::log.info "Starting TorrServer on internal HTTP port ${TS_INTERNAL_PORT}"
if [[ "$(bashio::config ssl)" = true ]]; then
  bashio::log.info "TorrServer HTTPS is enabled on port ${TS_SSL_PORT}"
fi
bashio::log.info "Starting Home Assistant web proxy on port ${TS_PORT}"

/usr/bin/torrserver ${FLAGS} &
TS_PID=$!

cleanup() {
  kill "${TS_PID}" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

nginx -c /run/nginx/nginx.conf -g 'daemon off;'
