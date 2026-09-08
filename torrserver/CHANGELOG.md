# Changelog

## 144.1.12 — MQTT Uptime sensor

### Добавлено
- Добавлен MQTT Discovery-сенсор `Uptime` для TorrServer.
- Uptime публикуется в секундах с `device_class: duration`.
- Счётчик uptime автоматически начинается заново после каждого запуска или автоматического restart TorrServer.
- Uptime обновляется вместе с острыми MQTT-метриками без изменения существующих MQTT topics.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress и Web UI `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- MQTT Discovery для Status, Version, Torrents, Storage free и Restarts.
- Иконка Add-on и `panel_icon: mdi:movie-open-play`.
