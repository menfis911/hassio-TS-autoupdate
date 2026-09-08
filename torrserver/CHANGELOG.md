# Changelog

## 144.1.11 — MQTT Discovery fix & diagnostics

### Исправлено
- Исправлены MQTT Discovery topics: теперь они соответствуют формату Home Assistant `homeassistant/<component>/<node_id>/config`.
- Discovery больше не публикуется в некорректный путь `homeassistant/torrserver/...`.
- Ошибки `mosquitto_pub` больше не скрываются.
- Добавлен отдельный MQTT diagnostic publish для проверки фактической записи сообщения в брокер.
- В логах Add-on теперь явно отображается `MQTT publish OK` или `MQTT publish FAILED` с причиной ошибки.
- Добавлена повторная попытка Discovery при неудачной публикации.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress и Web UI `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- Иконка Add-on и `panel_icon: mdi:movie-open-play`.
