# Changelog

## 144.1.5 — Home Assistant sensors

### Добавлено
- MQTT Discovery для Home Assistant.
- Сенсор текущего статуса TorrServer.
- Сенсор версии TorrServer.
- Сенсор количества torrent-задач.
- Сенсор свободного места в `/config`.
- Все сенсоры объединяются в устройство `TorrServer`.

### Изменено
- MQTT является необязательным: без доступного брокера TorrServer продолжает работать нормально.
