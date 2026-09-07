# TorrServer для Home Assistant — AutoUpdate

Приватный Home Assistant Add-on для TorrServer.

Проект создан на основе оригинального аддона [aatrubilin/hassio-torrserver](https://github.com/aatrubilin/hassio-torrserver) и развивается отдельно.

## Что делает проект

Аддон запускает TorrServer в Home Assistant и поддерживает архитектуры `amd64` и `aarch64`.

Главная особенность проекта — автоматическое отслеживание новых стабильных релизов TorrServer.

GitHub Actions проверяет официальный репозиторий [YouROK/TorrServer](https://github.com/YouROK/TorrServer) один раз в три дня в 03:00 по московскому времени. Если появляется новый релиз, версия TorrServer обновляется в проекте, после чего автоматически запускается сборка нового Docker-образа.

## Схема обновления

```text
YouROK/TorrServer
        │
        │ новый release
        ▼
GitHub Actions
        │
        │ проверка каждые 3 дня
        ▼
UPSTREAM_VERSION
        │
        ▼
сборка Add-on
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

## Репозиторий

Проект предназначен для личного использования владельцем репозитория.

Исходный проект:
https://github.com/aatrubilin/hassio-torrserver

TorrServer:
https://github.com/YouROK/TorrServer

## Важно

Репозиторий является приватным. Это позволяет держать исходный код и CI/CD под личным контролем.

Для установки аддона в Home Assistant необходимо предоставить Home Assistant доступ к источнику аддона. Сам факт того, что GitHub-репозиторий приватный, не делает опубликованный Docker-образ автоматически приватным для Home Assistant.
