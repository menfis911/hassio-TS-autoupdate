# Changelog

## 144.1.14 — TrackTimecode

### Добавлено
- Новая настройка Add-on `track_timecode`.
- По умолчанию включена (`true`).
- При запуске Add-on настройка передаётся в TorrServer `TrackTimecode` через его API.
- Если значение уже совпадает, повторное изменение настроек TorrServer не выполняется.
- Поддерживается включение и отключение TrackTimecode через конфигурацию Home Assistant Add-on.

### Что это даёт
- TorrServer сохраняет позицию воспроизведения (timecode) просмотренного видео.
- Это позволяет клиентам, которые поддерживают viewed/timecode, продолжать просмотр с последней позиции.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress и Web UI `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- MQTT Discovery для Status, Version, Torrents, Storage free, Restarts и Uptime.
- Иконка Add-on и `panel_icon: mdi:movie-open-play`.

## 144.1.13 — Human-readable MQTT Uptime

### Изменено
- Uptime теперь отображается в Home Assistant в человекочитаемом формате: `ч мин с`.
- Например: `5 ч 27 мин 14 с`.
- MQTT Uptime больше не публикуется как числовой sensor с `device_class: duration`; теперь это обычный текстовый sensor для корректного отображения часов, минут и секунд.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress и Web UI `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- MQTT Discovery для Status, Version, Torrents, Storage free, Restarts и Uptime.
- Иконка Add-on и `panel_icon: mdi:movie-open-play`.
