# TorrServer для Home Assistant — AutoUpdate

Home Assistant Add-on для TorrServer для личного использования.

Проект является форком и развитием оригинального аддона `aatrubilin/hassio-torrserver`. Он поддерживается отдельно и находится под собственным контролем.

## Что умеет

- запускает TorrServer в Home Assistant;
- автоматически отслеживает новые стабильные версии TorrServer;
- собирает обновлённый Add-on для `amd64` и `aarch64`;
- хранит настройки и torrent-данные между обновлениями;
- поддерживает HTTP Basic Auth, Telegram token, proxy и SSL;
- поддерживает Home Assistant Ingress и Watchdog;
- проверяет SHA-256 release asset перед сборкой.

## Обновления

Новые стабильные релизы TorrServer проверяются автоматически. При выходе новой версии проект обновляет версию Add-on, собирает новый образ и публикует его в GHCR.

Если в Home Assistant включено автоматическое обновление Add-on, Home Assistant установит новую версию самостоятельно.

## Версионность

Версия Add-on связана с версией TorrServer:

```text
TorrServer MatriX.144.1  -> Add-on 144.1.x
TorrServer MatriX.145.2  -> Add-on 145.2.x
TorrServer MatriX.146    -> Add-on 146.0.x
```

Точная upstream-версия хранится в `torrserver/UPSTREAM_VERSION`.

## Changelog

Полная история изменений проекта хранится в [`torrserver/CHANGELOG.md`](torrserver/CHANGELOG.md).

В интерфейсе Home Assistant для обновления используется информация только о текущем релизе, чтобы список изменений не дублировал всю историю проекта.

## Репозиторий

Проект предназначен для личного использования и не является официальным аддоном TorrServer или Home Assistant.

Это форк оригинального Home Assistant Add-on:
`aatrubilin/hassio-torrserver`

TorrServer:
`YouROK/TorrServer`
