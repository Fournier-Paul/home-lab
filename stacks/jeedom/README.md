# Jeedom

Blueprint stack: Jeedom + Mosquitto (MQTT) + Zigbee2MQTT.

This repository is intended as a **clean, public homelab template**.  
My current production setup already runs on a Raspberry Pi 5; the goal here is **documentation + reproducible infrastructure**, without committing runtime data or secrets.

## Prerequisites
- Docker + Docker Compose
- Zigbee USB dongle available on the host (example: `/dev/ttyACM0`)

## Files
- `compose.yml`: stack definition
- `.env.example`: configuration template (ports, device path, pinned images)
- `mosquitto/config/mosquitto.conf.example`: secure Mosquitto config example

## Safe validation (does not deploy)
```bash
cp .env.example .env
docker compose -f compose.yml config >/dev/null && echo OK

