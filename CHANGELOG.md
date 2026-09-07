# Changelog

Все изменения проекта фиксируются здесь. Версия Home Assistant Add-on соответствует версии проекта, а `UPSTREAM_VERSION` содержит точную версию TorrServer.

## 144.1.0 — production

**TorrServer:** `MatriX.144.1`

Первый production-релиз проекта с полностью автоматизированным обновлением upstream-версии.

### Добавлено
- Собственный Home Assistant Add-on `TorrServer AutoUpdate`.
- Сборка multi-arch для `amd64` и `aarch64`.
- Использование официального бинарного релиза TorrServer.
- Проверка SHA-256 digest официального release asset перед включением бинарника в образ.
- Публикация образов в GHCR.
- Автоматическая проверка новых стабильных релизов TorrServer каждые 3 дня в 03:00 МСК.
- Автоматическая синхронизация версии Add-on с версией TorrServer.
- Автоматическое добавление release notes TorrServer в этот changelog.
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

- `MatriX.144.1` → Add-on `144.1.0`
- `MatriX.145.2` → Add-on `145.2.0`
- `MatriX.146` → Add-on `146.0.0`

Это позволяет Home Assistant видеть обновление Add-on каждый раз, когда выходит новая upstream-версия TorrServer.

При появлении нового release workflow автоматически добавляет новую секцию в начало этого файла с названием upstream-релиза и его официальными release notes.
