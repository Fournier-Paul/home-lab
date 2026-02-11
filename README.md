# Homelab — Docker Compose stacks

This repository contains Docker Compose stack templates.
Each stack is self-contained: compose files, configuration templates, and stack-level documentation.

## Repository layout
- `stacks/` — independent stacks (compose + `.env.example` + stack README)
- `docs/` — architecture / operational notes
- `scripts/` — helper scripts (optional)

## Prerequisites
- Docker + Docker Compose
- Linux host

## Stacks
- **Monitoring** — `stacks/monitoring/`  
  Prometheus + Grafana + node-exporter, optional Loki/Promtail  
  Docs: `stacks/monitoring/README.md`

- **Jeedom / IoT** — `stacks/jeedom/`  
  Jeedom + Mosquitto + Zigbee2MQTT  
  Docs: `stacks/jeedom/README.md`

- **Nextcloud AIO** — `stacks/nextcloud-aio/`  
  Nextcloud All-in-One mastercontainer template  
  Docs: `stacks/nextcloud-aio/README.md`

## Validation (no deployment)
Validate compose syntax without starting containers.
Uses `.env.example` so validation works without local `.env`.

```bash
docker compose --env-file stacks/monitoring/.env.example \
  -f stacks/monitoring/compose.yml config >/dev/null && echo "monitoring: OK"

docker compose --env-file stacks/monitoring/.env.example \
  -f stacks/monitoring/compose.yml -f stacks/monitoring/compose.logging.yml config >/dev/null && echo "monitoring+logging: OK"

docker compose --env-file stacks/jeedom/.env.example \
  -f stacks/jeedom/compose.yml config >/dev/null && echo "jeedom: OK"

docker compose --env-file stacks/nextcloud-aio/.env.example \
  -f stacks/nextcloud-aio/compose.yml config >/dev/null && echo "nextcloud-aio: OK"
```

## Deploy / Run
Recommended workflow: copy `.env.example` → `.env`, adjust ports, then run from the stack directory.

### Monitoring
```bash
cd stacks/monitoring
cp .env.example .env
nano .env

# metrics only
docker compose -f compose.yml up -d

# metrics + logging (Loki/Promtail)
docker compose -f compose.yml -f compose.logging.yml up -d
```

### Jeedom
```bash
cd stacks/jeedom
cp .env.example .env
nano .env

# local Mosquitto config (from example)
cp mosquitto/config/mosquitto.conf.example mosquitto/config/mosquitto.conf

docker compose -f compose.yml up -d
```

### Nextcloud AIO
```bash
cd stacks/nextcloud-aio
cp .env.example .env
nano .env

docker compose -f compose.yml up -d
```

## Default ports (from `.env.example`)
Ports can be changed per stack in `.env`.

- `stacks/monitoring`
  - Grafana: `3000`
  - Prometheus: `9090`
  - node-exporter: `9100`
  - Loki (optional): `3100`

- `stacks/jeedom`
  - Jeedom: `40080`
  - Zigbee2MQTT: `8081`
  - MQTT: `1883`

- `stacks/nextcloud-aio`
  - AIO UI: `18080`
  - AIO Apache: `11000`

## Version control policy
Runtime state and local configuration are not committed. Examples:
- `.env` files (use `.env.example`)
- data directories / volumes / logs (e.g. Zigbee2MQTT data, Mosquitto data/logs)
- credentials / secrets / keys / certificates

Refer to `.gitignore` files (root and per-stack) for the full exclusion list.

