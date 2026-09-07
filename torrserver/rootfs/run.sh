#!/usr/bin/with-contenv bashio
set -euo pipefail

TS_PORT=$(bashio::config port)
TS_SSL_PORT=$(bashio::config ssl_port)
mkdir -p /config /config/torrents
FLAGS="--path /config --torrentsdir /config/torrents --port ${TS_PORT}"

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

bashio::log.info "Starting TorrServer on HTTP port ${TS_PORT}"
if [[ "$(bashio::config ssl)" = true ]]; then
  bashio::log.info "HTTPS enabled on port ${TS_SSL_PORT}"
fi

exec /usr/bin/torrserver ${FLAGS}
