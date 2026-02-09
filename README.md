# Homelab (Raspberry Pi 5)

Docker Compose regroupant plusieurs stacks self-hosted (observabilité, domotique, cloud perso).
Objectif : proposer des templates propres, reproductibles et publiables (sans données runtime ni secrets).

## Stacks :
- monitoring : Prometheus + Grafana + node-exporter (+ Loki/Promtail en option) → stacks/monitoring
- jeedom : Jeedom + Zigbee2MQTT + Mosquitto → stacks/jeedom
- nextcloud : template / notes → stacks/nextcloud

## Quickstart :
cp stacks/<stack>/.env.example stacks/<stack>/.env
docker compose -f stacks/<stack>/compose.yml config >/dev/null && echo OK
docker compose -f stacks/<stack>/compose.yml up -d
