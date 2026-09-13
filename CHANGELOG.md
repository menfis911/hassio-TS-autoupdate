# Changelog

## MatriX.144.4 — 2026-09-13

**TorrServer:** `MatriX.144.4`  
**Upstream release:** MatriX.144.4

### Release notes from upstream

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.144.3...MatriX.144.4

Все изменения проекта фиксируются здесь. Версия Home Assistant Add-on соответствует версии проекта, а `UPSTREAM_VERSION` содержит точную версию TorrServer.

## 144.1.13 — Human-readable MQTT Uptime

### Изменено
- Uptime теперь отображается в Home Assistant в человекочитаемом формате: `ч мин с`.
- Например: `5 ч 27 мин 14 с`.
- MQTT Uptime больше не публикуется как числовой sensor с `device_class: duration`; теперь это обычный текстовый sensor для корректного отображения часов, минут и секунд.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- MQTT Discovery для Status, Version, Torrents, Storage free, Restarts и Uptime.
- Собственная иконка Add-on и `panel_icon: mdi:movie-open-play`.

## 144.1.12 — MQTT Uptime sensor

### Добавлено
- Добавлен MQTT Discovery-сенсор `Uptime` для TorrServer.
- Uptime публикуется в секундах с `device_class: duration`.
- Счётчик uptime автоматически начинается заново после каждого запуска или автоматического restart TorrServer.
- Uptime обновляется вместе с существующими MQTT-метриками.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- MQTT Discovery для Status, Version, Torrents, Storage free и Restarts.
- Собственная иконка Add-on и `panel_icon: mdi:movie-open-play`.

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
- Home Assistant Ingress `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- Собственная иконка Add-on и `panel_icon: mdi:movie-open-play`.

## 144.1.10 — MQTT Discovery reliability

### Исправлено
- MQTT Discovery больше не зависит от того, успел ли MQTT-брокер запуститься одновременно с Add-on.
- Добавлен повторный поиск MQTT service и повторные попытки подключения.
- Discovery-сообщения повторно публикуются после успешного подключения к брокеру.
- Ошибки подключения и публикации MQTT теперь фиксируются в логе Add-on.
- После успешного подключения в логах отображаются MQTT broker и подтверждение публикации Discovery.

### Сохранено
- TorrServer `MatriX.144.1`.
- Home Assistant Ingress `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Автоматический healthcheck и recovery TorrServer.
- Все существующие настройки TorrServer.
- Собственная иконка Add-on и `panel_icon: mdi:movie-open-play`.

## 144.1.9 — Health Recovery & Diagnostics

### Добавлено
- Автоматический healthcheck TorrServer каждые 10 секунд.
- Автоматический restart TorrServer после трёх последовательных неудачных healthcheck.
- Автоматический запуск TorrServer, если его процесс неожиданно завершился.
- Расширенная диагностика в логах Add-on.
- MQTT Discovery-сенсор количества автоматических restart.

### Сохранено
- Home Assistant Ingress `/ui/`.
- Прямой доступ через порт `8090`.
- WebSocket и streaming.
- Существующие MQTT Discovery-сенсоры.
- Собственная иконка Add-on и `panel_icon: mdi:movie-open-play`.

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
- Обновлена иконка TorrServer в боковой панели Home Assistant: `mdi:server-network`.
- Версия Add-on повышена до `144.1.6`, чтобы Home Assistant гарантированно увидел изменение.

## 144.1.5 — Home Assistant sensors

### Добавлено
- Добавлена опциональная MQTT Discovery для Home Assistant.
- Add-on публикует статус TorrServer, текущую версию, количество torrent-задач и свободное место в `/config`.
- Сенсоры объединяются в одно устройство `TorrServer` и доступны для карточек, автоматизаций и дашбордов Home Assistant.

### Изменено
- MQTT используется как необязательная интеграция: если брокер недоступен, TorrServer продолжает работать без сенсоров.

## 144.1.4 — project polish

### Изменено
- Добавлена собственная иконка Home Assistant Add-on.
- Changelog внутри Add-on теперь содержит только изменения текущей версии.
- Полная история изменений проекта хранится только в этом файле.
- Упрощено описание проекта и документация.

## 144.1.3 — Home Assistant Ingress

**TorrServer:** `MatriX.144.1`

### Исправлено
- Улучшена работа Web UI через Home Assistant Ingress.
- Добавлена стабильная точка входа `/ui/` для Ingress.
- Прямой доступ через `IP:8090` сохранён.
- WebSocket, streaming и длинные таймауты сохранены.

## 144.1.0 — production

**TorrServer:** `MatriX.144.1`

Первый production-релиз проекта с полностью автоматизированным обновлением upstream-версии.

### Добавлено
- Собственный Home Assistant Add-on `TorrServer AutoUpdate`.
- Сборка multi-arch для `amd64` и `aarch64`.
- Использование официального бинарного релиза TorrServer.
- Проверка SHA-256 digest официального бинарника TorrServer перед включением бинарника в образ.
- Публикация образов в GHCR.
- Автоматическая проверка новых стабильных релизов TorrServer каждые 3 дня.
- Автоматическая синхронизация версии Add-on с версией TorrServer.
- Поддержка HTTP Basic Auth, Telegram token, proxy, web log и SSL.

## 0.5.0 — development milestone

- Добавлена автоматическая синхронизация версии Home Assistant Add-on с upstream-релизом TorrServer.
- Версия Add-on отделена от точного upstream-идентификатора в `UPSTREAM_VERSION`.

## 0.4.0 — development milestone

- Добавлена проверка SHA-256 digest официального бинарника TorrServer.
- Исключена возможность незаметно собрать образ из изменённого release asset.

## 0.3.0 — development milestone

- Добавлена multi-arch сборка Docker-образа.
- Целевые архитектуры: `amd64` и `aarch64`.
- Добавлена публикация multi-arch manifest в GHCR.

## 0.2.0 — development milestone

- Проект переведён на собственный Docker image.
- Конфигурация Add-on переработана под текущую архитектуру TorrServer.
- Добавлен собственный runtime entrypoint.

## 0.1.0 — development milestone

- Создан проект на основе оригинального Home Assistant Add-on `aatrubilin/hassio-torrserver`.
- Репозиторий отделён от исходного проекта.
- Заложена архитектура для независимого управления версиями TorrServer.

---

## Как читать версии

Например:

- `MatriX.144.1` → базовая версия Add-on `144.1.x`
- `MatriX.145.2` → базовая версия Add-on `145.2.x`
- `MatriX.146` → базовая версия Add-on `146.0.x`

Последняя цифра Add-on может использоваться для внутренних исправлений и функций проекта, поэтому точную upstream-версию всегда следует смотреть в `UPSTREAM_VERSION`.

При появлении нового release workflow автоматически добавляет новую секцию в начало этого файла с названием upstream-релиза и его официальными release notes.
