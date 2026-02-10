# Homelab (Raspberry Pi 5)

Infrastructure templates using Docker Compose, organized as independent stacks.

## Repository layout
- `stacks/` — self-contained stacks (compose files + config templates)
- `docs/` — architecture and operations notes
- `scripts/` — helper scripts (optional)

## Stacks
- `stacks/monitoring` — Prometheus, Grafana, node-exporter (+ optional Loki/Promtail)
- `stacks/jeedom` — Jeedom, Mosquitto, Zigbee2MQTT
- `stacks/nextcloud-aio` — Nextcloud All-in-One mastercontainer

## Validation (no deployment)
Validate compose syntax without starting containers:

```bash
docker compose -f stacks/monitoring/compose.yml config >/dev/null
docker compose -f stacks/monitoring/compose.yml -f stacks/monitoring/compose.logging.yml config >/dev/null
docker compose -f stacks/jeedom/compose.yml config >/dev/null
docker compose -f stacks/nextcloud-aio/compose.yml config >/dev/null

