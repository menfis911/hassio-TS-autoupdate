# Карточка TorrServer для Home Assistant

После включения MQTT Discovery Home Assistant создаёт устройство `TorrServer` и его сенсоры.

Для простой карточки на главном экране можно использовать:

```yaml
type: entities
title: TorrServer
show_header_toggle: false
entities:
  - entity: binary_sensor.torrserver_status
    name: Статус
  - entity: sensor.torrserver_version
    name: Версия
  - entity: sensor.torrserver_torrents
    name: Torrents
  - entity: sensor.torrserver_storage_free
    name: Свободное место
```

Карточка будет показывать:

- работает ли TorrServer прямо сейчас;
- текущую версию TorrServer;
- количество torrent-задач;
- свободное место в каталоге `/config`.

Если MQTT Discovery отключён или MQTT-брокер недоступен, эти сущности не создаются, но сам TorrServer продолжает работать.
