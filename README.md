# TorrServer для Home Assistant — AutoUpdate

Приватный Home Assistant Add-on для TorrServer.

Проект создан на основе оригинального аддона `aatrubilin/hassio-torrserver` и развивается отдельно под собственным контролем.

## Текущая версия

- **Home Assistant Add-on:** `144.1.0`
- **TorrServer:** `MatriX.144.1`
- **Архитектуры:** `amd64`, `aarch64`

История изменений находится в [`CHANGELOG.md`](CHANGELOG.md).

## Что делает проект

Аддон запускает TorrServer в Home Assistant и использует официальный upstream-релиз TorrServer как источник бинарника.

Главная особенность проекта — автоматическое отслеживание новых стабильных релизов TorrServer.

GitHub Actions проверяет официальный репозиторий `YouROK/TorrServer` один раз в три дня в 03:00 по московскому времени. Если появляется новый релиз, workflow:

1. получает официальный release;
2. проверяет формат версии;
3. обновляет `torrserver/UPSTREAM_VERSION`;
4. рассчитывает новую версию Home Assistant Add-on;
5. обновляет `torrserver/config.yaml`;
6. добавляет release notes upstream в `CHANGELOG.md`;
7. коммитит изменения;
8. запускает обычную multi-arch сборку Add-on.

## Версионность

Версия Home Assistant Add-on специально синхронизируется с TorrServer.

Примеры:

```text
TorrServer MatriX.144.1  -> Add-on 144.1.0
TorrServer MatriX.145.2  -> Add-on 145.2.0
TorrServer MatriX.146    -> Add-on 146.0.0
```

Точная upstream-версия хранится отдельно в:

```text
torrserver/UPSTREAM_VERSION
```

Это важно: Home Assistant видит новую версию Add-on, поэтому обновление не зависит от ручного изменения версии владельцем проекта.

Исторические `0.x` версии в `CHANGELOG.md` — это development milestones, через которые проект проходил во время разработки. Первой production-версией считается `144.1.0`.

## Схема обновления

```text
YouROK/TorrServer
        │
        │ новый stable release
        ▼
GitHub Actions
        │
        │ каждые 3 дня / 03:00 МСК
        ▼
UPSTREAM_VERSION + config.yaml
        │
        ├── CHANGELOG.md
        │
        ▼
Home Assistant Builder
        │
        ├── amd64
        └── aarch64
        │
        ▼
GHCR multi-arch image
        │
        ▼
Home Assistant
```

## Поддерживаемые архитектуры

- `amd64`
- `aarch64`

## Возможности Add-on

- TorrServer на официальном upstream-бинарнике.
- Автоматическое обновление upstream-версии.
- Проверка SHA-256 digest release asset во время сборки.
- HTTP Basic Auth.
- Telegram token для встроенного Telegram API TorrServer.
- Proxy: `tracker`, `peers`, `full`.
- Web access log.
- HTTPS/SSL с отдельным HTTPS-портом и пользовательскими сертификатами.
- Постоянное хранение конфигурации и torrent-данных в `/config`.
- Ingress Home Assistant.
- Watchdog `/echo`.

## Репозиторий

Проект предназначен для личного использования владельцем репозитория.

Исходный проект:
https://github.com/aatrubilin/hassio-torrserver

TorrServer:
https://github.com/YouROK/TorrServer

## Важно о приватности

Репозиторий является приватным. Это позволяет держать исходный код и CI/CD под личным контролем.

При этом приватность GitHub-репозитория и доступность Docker-образа в GHCR — разные уровни доступа. Для установки Add-on в Home Assistant необходимо отдельно определить способ предоставления Home Assistant доступа к источнику Add-on/образу.

## Changelog

Полная история версий и development milestones:

- [`CHANGELOG.md`](CHANGELOG.md)
