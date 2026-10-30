# Changelog

## MatriX.147.2 — 2026-10-29

**TorrServer:** `MatriX.147.2`  
**Upstream release:** MatriX.147.2

### Release notes from upstream

## What's Changed
* fix(api): restart DLNA, Bonjour and rutor after resetting settings to defaults by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/934
* fix(m3u): attach external tracks only when they carry the whole video name by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/935
* fix(subs): match the video name only up to a word boundary by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/937
* fix(torrfs): tell torrents with the same title apart in WebDAV and FUSE by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/933
* fix(m3u): derive the playlist ETag from its content by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/938
* fix(waf): read link-local IPv6 clients with a zone by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/944
* fix(waf): match referer rules for IDN hosts in punycode by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/943
* fix(api): reject a settings set request without sets by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/942
* fix(api): answer a malformed hash with not found instead of a panic by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/941


**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.147.1...MatriX.147.2

## MatriX.147.1 — 2026-10-23

**TorrServer:** `MatriX.147.1`  
**Upstream release:** MatriX.147.1

### Release notes from upstream

## What's Changed
* chore(deps): bump follow-redirects from 1.16.0 to 1.16.1 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/930
* fix(api): keep query values with a literal % when decoding them again by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/928
* fix(subs): map every Windows-1251 byte, not only Russian letters by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/923


**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.147...MatriX.147.1

## MatriX.147 — 2026-10-16

**TorrServer:** `MatriX.147`  
**Upstream release:** MatriX.147

### Release notes from upstream

## What's Changed
* External subtitles support by @alexeynl in https://github.com/YouROK/TorrServer/pull/911
* Torznab: fix API URL handling and add User-Agent header by @VuzzyM in https://github.com/YouROK/TorrServer/pull/919
* docs: update Torznab configuration documentation and UI hints by @pavelpikta in https://github.com/YouROK/TorrServer/pull/920
* docs: update README documentation by @pavelpikta in https://github.com/YouROK/TorrServer/pull/921
* fix(utils): sort "Episode 1" before "Episode 10" in file lists by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/913
* fix(m3u): number merged all.m3u files the way /stream does by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/914

## New Contributors
* @alexeynl made their first contribution in https://github.com/YouROK/TorrServer/pull/911
* @jayhemnani9910 made their first contribution in https://github.com/YouROK/TorrServer/pull/913

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.146.2...MatriX.147

## MatriX.146.2 — 2026-10-14

**TorrServer:** `MatriX.146.2`  
**Upstream release:** MatriX.146.2

### Release notes from upstream

## What's Changed
* feat(gst): add VAAPI hardware encoder backend by @Whishp in https://github.com/YouROK/TorrServer/pull/915

## New Contributors
* @Whishp made their first contribution in https://github.com/YouROK/TorrServer/pull/915

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.146.1...MatriX.146.2

## MatriX.146.1 — 2026-10-12

**TorrServer:** `MatriX.146.1`  
**Upstream release:** MatriX.146.1

### Release notes from upstream

## What's Changed
* chore(deps): bump proxy-addr from 2.0.7 to 2.0.8 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/905
* chore(deps): bump pbkdf2 from 3.1.3 to 3.1.7 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/904
* chore(deps): bump compression from 1.7.5 to 1.8.2 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/903
* chore(deps): bump source-map-js from 1.2.1 to 1.2.2 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/901
* chore(deps): bump axios from 1.18.0 to 1.20.0 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/902
* chore(deps): bump brace-expansion from 1.1.18 to 1.1.21 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/907
* chore(deps): bump fast-uri from 3.1.7 to 3.1.8 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/906
* fix(web): revalidate index.html so upgrades show the new web UI by @lieranderl in https://github.com/YouROK/TorrServer/pull/908
* fix(torr): stop concurrent stream requests racing on torrent state by @lieranderl in https://github.com/YouROK/TorrServer/pull/909
* Fixed passing command line arguments to docker by @mu-zeta in https://github.com/YouROK/TorrServer/pull/910

## New Contributors
* @mu-zeta made their first contribution in https://github.com/YouROK/TorrServer/pull/910

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.146...MatriX.146.1

## MatriX.146 — 2026-10-08

**TorrServer:** `MatriX.146`  
**Upstream release:** MatriX.146

### Release notes from upstream

## What's Changed
* feat(ssl): manage the HTTPS certificate from the web UI without a restart by @lieranderl in https://github.com/YouROK/TorrServer/pull/899
* perf: buffer HTTP stream reads to reduce client-lock contention by @vladikshkwok in https://github.com/YouROK/TorrServer/pull/900

## New Contributors
* @vladikshkwok made their first contribution in https://github.com/YouROK/TorrServer/pull/900

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.145.2...MatriX.146

## MatriX.145.2 — 2026-10-04

**TorrServer:** `MatriX.145.2`  
**Upstream release:** MatriX.145.2

### Release notes from upstream

## What's Changed
* fix(ssl): never replace user-supplied certs, tighten generated key perms by @lieranderl in https://github.com/YouROK/TorrServer/pull/884
* fix: find Entware root CA certificates for outgoing HTTPS by @lieranderl in https://github.com/YouROK/TorrServer/pull/890
* test(rutor): skip parse tests when rutor.ls is missing by @lieranderl in https://github.com/YouROK/TorrServer/pull/893
* test(trackers): fix data race in refresh tests by @lieranderl in https://github.com/YouROK/TorrServer/pull/894
* feat(ssl): cert hot reload, managed servers, strict --force-https, --http-media, --https-only by @lieranderl in https://github.com/YouROK/TorrServer/pull/885
* fix(torr): stop the nil dereference when settings reconnect the client by @ManSio in https://github.com/YouROK/TorrServer/pull/896

## New Contributors
* @ManSio made their first contribution in https://github.com/YouROK/TorrServer/pull/896

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.145.1...MatriX.145.2

## MatriX.145.1 — 2026-09-30

**TorrServer:** `MatriX.145.1`  
**Upstream release:** MatriX.145.1

### Release notes from upstream

## What's Changed
* fix: send a User-Agent when checking poster images by @uPagge in https://github.com/YouROK/TorrServer/pull/882
* fix: retry BT client connect after settings save by @uPagge in https://github.com/YouROK/TorrServer/pull/883
* fix(macos): plist file update process by @pavelpikta in https://github.com/YouROK/TorrServer/pull/874
* refactor: image URL validation by @pavelpikta in https://github.com/YouROK/TorrServer/pull/871
* gstreamer: re-encode AAC profiles browsers cannot play (Main, SSR, LTP) by @lieranderl in https://github.com/YouROK/TorrServer/pull/879
* fix(torrstor): evict partially downloaded pieces last by @LuckyRu in https://github.com/YouROK/TorrServer/pull/875
* fix(torrstor): never park a reader while a read is in flight by @LuckyRu in https://github.com/YouROK/TorrServer/pull/876

## New Contributors
* @uPagge made their first contribution in https://github.com/YouROK/TorrServer/pull/882
* @LuckyRu made their first contribution in https://github.com/YouROK/TorrServer/pull/875

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.145...MatriX.145.1

## MatriX.145 — 2026-09-17

**TorrServer:** `MatriX.145`  
**Upstream release:** MatriX.145

### Release notes from upstream

## What's Changed
* feat(web): add one-click VLC action to single-file torrent cards by @SHAREN in https://github.com/YouROK/TorrServer/pull/815
* Add AppImage support for Linux amd64, arm64 and arm7 by @VuzzyM in https://github.com/YouROK/TorrServer/pull/838
* feat: manual categories for torznab by @DrachenClon22 in https://github.com/YouROK/TorrServer/pull/841
* Update Romanian translations by @VuzzyM in https://github.com/YouROK/TorrServer/pull/846
* Return a JSON body when /torrents rejects a request by @nfvelten in https://github.com/YouROK/TorrServer/pull/848
* feat(torznab): add Prowlarr indexer tracker support by @VuzzyM in https://github.com/YouROK/TorrServer/pull/850
* fix(web): SettingsDialog to support 'textarea' type input by @pavelpikta in https://github.com/YouROK/TorrServer/pull/849
* feat: add native MCP server for AI agents by @pavelpikta in https://github.com/YouROK/TorrServer/pull/840
* chore(Dockerfile): update Go version from 1.27.0 to 1.27.1 by @pavelpikta in https://github.com/YouROK/TorrServer/pull/855
* feat: update TrackersListURL handling by @pavelpikta in https://github.com/YouROK/TorrServer/pull/856
* chore(deps): update go-ffprobe dependency to v2.3.0 by @pavelpikta in https://github.com/YouROK/TorrServer/pull/857
* feat(waf): add HTTP access WAF with settings UI and API by @pavelpikta in https://github.com/YouROK/TorrServer/pull/847
* chore(deps): bump fast-uri from 3.1.5 to 3.1.7 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/853
* feat(server): add builds for iOS XCFramework by @pavelpikta in https://github.com/YouROK/TorrServer/pull/858
* chore(deps): bump js-yaml from 3.15.1 to 3.15.2 in /web by @dependabot[bot] in https://github.com/YouROK/TorrServer/pull/863
* mute LPD excessive logging by @tsynik
* feat: add MergeAllM3U setting to merge all torrent playlists into a single all.m3u by @VuzzyM in https://github.com/YouROK/TorrServer/pull/867
* fix (go-ffprobe):  parse Chapters by @tsynik
* fix (server): ffprobe binary path setup  by @tsynik
* feature (server): add json errors output to /stream and /ffp endpoints by @tsynik

## New Contributors
* @SHAREN made their first contribution in https://github.com/YouROK/TorrServer/pull/815
* @DrachenClon22 made their first contribution in https://github.com/YouROK/TorrServer/pull/841
* @nfvelten made their first contribution in https://github.com/YouROK/TorrServer/pull/848

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.144...MatriX.145

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
