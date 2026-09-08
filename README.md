# TorrServer для Home Assistant — AutoUpdate

Home Assistant Add-on для TorrServer для личного использования.

Это форк и развитие оригинального аддона `aatrubilin/hassio-torrserver`. Проект поддерживается отдельно, а обновления TorrServer отслеживаются автоматически.

## Что умеет

- запускает TorrServer в Home Assistant;
- автоматически отслеживает новые стабильные версии TorrServer;
- собирает обновлённый Add-on для `amd64` и `aarch64`;
- сохраняет настройки и torrent-данные между обновлениями;
- поддерживает HTTP Basic Auth, Telegram token, proxy и SSL;
- поддерживает Home Assistant Ingress и Watchdog;
- публикует статус и базовые показатели в Home Assistant через MQTT Discovery;
- проверяет SHA-256 release asset перед сборкой.

## Обновления

При выходе новой стабильной версии TorrServer проект автоматически обновляет версию Add-on, собирает новый образ и публикует его в GHCR.

Если в Home Assistant включено автоматическое обновление Add-on, новая версия будет установлена автоматически.

## Сенсоры и дашборд

Если в Home Assistant настроен MQTT, Add-on автоматически создаёт устройство `TorrServer` с сенсорами:

- статус TorrServer;
- текущая версия;
- количество torrent-задач;
- свободное место в `/config`.

Готовая карточка для главного экрана находится в `torrserver/DASHBOARD.md`.

MQTT Discovery можно отключить в настройках Add-on параметром `mqtt_discovery`.

## Версионность

Версия Add-on связана с версией TorrServer:

```text
TorrServer MatriX.144.1  -> Add-on 144.1.x
TorrServer MatriX.145.2  -> Add-on 145.2.x
TorrServer MatriX.146    -> Add-on 146.0.x
```

Точная upstream-версия хранится в `torrserver/UPSTREAM_VERSION`.

Полная история изменений проекта находится в корневом `CHANGELOG.md`.

## Репозиторий

Проект предназначен для личного использования и не является официальным аддоном TorrServer или Home Assistant.

Основа проекта — форк оригинального Home Assistant Add-on `aatrubilin/hassio-torrserver`.

TorrServer: `YouROK/TorrServer`
