ARG BUILD_ARCH
ARG BUILD_VERSION
ARG TORRSERVER_VERSION=MatriX.144.1

FROM ghcr.io/home-assistant/base:3.24

ARG BUILD_ARCH
ARG BUILD_VERSION
ARG TORRSERVER_VERSION

RUN apk add --no-cache ca-certificates curl jq \
    && case "${BUILD_ARCH}" in \
         amd64) TS_ARCH="amd64" ;; \
         aarch64) TS_ARCH="arm64" ;; \
         *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
       esac \
    && curl -fsSL "https://github.com/YouROK/TorrServer/releases/download/${TORRSERVER_VERSION}/TorrServer-linux-${TS_ARCH}" \
       -o /usr/bin/torrserver \
    && chmod 0755 /usr/bin/torrserver \
    && /usr/bin/torrserver --version || true

ENV TS_CONF_PATH="/config" \
    TS_TORR_DIR="/config/torrents" \
    GODEBUG="madvdontneed=1"

COPY rootfs /
RUN chmod 0755 /run.sh

LABEL \
    io.hass.type="app" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.version="${BUILD_VERSION}" \
    org.opencontainers.image.title="TorrServer AutoUpdate" \
    org.opencontainers.image.source="https://github.com/menfis911/hassio-TS-autoupdate"

CMD ["/run.sh"]
