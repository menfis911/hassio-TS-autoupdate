#!/usr/bin/with-contenv bashio
set -euo pipefail

TS_PORT=$(bashio::config port)
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
  FLAGS="${FLAGS} --tgtoken=$(bashio::config tgtoken)"
fi

if [[ -n "$(bashio::config m3u_custom_host)" ]]; then
  export M3U_CUSTOM_HOST="$(bashio::config m3u_custom_host)"
fi

if [[ "$(bashio::config weblog)" = true ]]; then
  FLAGS="${FLAGS} --weblogpath /dev/stdout"
fi

if [[ "$(bashio::config proxymode)" != disabled ]]; then
  PROXY_MODE=$(bashio::config proxymode)
  PROXY_URL=$(bashio::config proxyurl)
  [[ -n "${PROXY_URL}" ]] || bashio::exit.nok
  FLAGS="${FLAGS} --proxyurl=${PROXY_URL} --proxymode=${PROXY_MODE}"
fi

bashio::log.info "Starting TorrServer on port ${TS_PORT}"
exec /usr/bin/torrserver ${FLAGS}
