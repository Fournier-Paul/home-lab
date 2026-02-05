# Monitoring

Observability stack using Prometheus + Grafana + node-exporter.
Optional logging using Loki + Promtail.

## Quickstart (metrics)
```bash
cp .env.example .env
docker compose -f compose.yml up -d
