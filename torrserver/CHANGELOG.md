# Changelog

## 144.1.9 — Health Recovery & Diagnostics

### Добавлено
- Добавлен автоматический healthcheck TorrServer каждые 10 секунд.
- При трёх последовательных неудачных healthcheck выполняется автоматический restart TorrServer без перезапуска всего Home Assistant Add-on.
- Если процесс TorrServer неожиданно завершился, Add-on автоматически запускает его снова.
- В логах Add-on теперь фиксируются старт, версия, состояние healthcheck, восстановление и количество автоматических restart.
- Добавлен MQTT Discovery-сенсор количества автоматических restart TorrServer.

### Сохранено
- Home Assistant Ingress и Web UI без изменения существующей схемы `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Существующая MQTT Discovery-интеграция.
- Иконка Add-on и `panel_icon: mdi:movie-open-play`.

## 144.1.8 — Add-on Icon Fix

### Исправлено
- Исправлена автоматическая генерация `torrserver/icon.png` из `torrserver/icon.svg`.
- Исправлена ошибка GitHub Actions, из-за которой PNG-иконка не генерировалась.
- Обновлена иконка Add-on в Home Assistant.
- Иконка боковой панели (`panel_icon`) не изменялась.

## 144.1.7 — Custom Add-on Icon

### Изменено
- Добавлена собственная иконка Add-on.
- Иконка боковой панели (`panel_icon`) не изменялась.

## 144.1.6 — Home Assistant UI

### Изменено
- Обновлена иконка TorrServer в боковой панели Home Assistant.
