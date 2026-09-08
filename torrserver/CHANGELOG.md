# Changelog

## 144.1.10 — MQTT Discovery reliability

### Исправлено
- MQTT Discovery больше не зависит от того, успел ли MQTT-брокер запуститься одновременно с Add-on.
- Добавлен повторный поиск MQTT service и повторные попытки подключения.
- Discovery-сообщения повторно публикуются после успешного подключения к брокеру.
- Ошибки подключения и публикации MQTT теперь фиксируются в логе Add-on.
- После успешного подключения в логах отображаются MQTT broker и подтверждение публикации Discovery.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress и Web UI `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- Иконка Add-on и `panel_icon: mdi:movie-open-play`.

