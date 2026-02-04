# Homelab (Raspberry Pi)

Monorepo "homelab" basé sur Docker Compose : self-hosting, observabilité et automatisation.
Objectif : montrer une approche production-minded (sécurité, reproductibilité, runbooks).

## Stacks
- Monitoring (Prometheus + Grafana + node-exporter) — `stacks/monitoring`
- Nextcloud — `stacks/nextcloud`
- Jeedom + Zigbee2MQTT + Mosquitto — `stacks/jeedom`

## Quickstart
Chaque stack a son `.env.example` :
```bash
cp stacks/<stack>/.env.example stacks/<stack>/.env
docker compose -f stacks/<stack>/compose.yml up -d
