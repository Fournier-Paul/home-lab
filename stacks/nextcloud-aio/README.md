# Nextcloud AIO

Blueprint stack to run Nextcloud using the All-in-One mastercontainer.

## Validate (no deployment)
```bash
cp .env.example .env
docker compose -f compose.yml config >/dev/null && echo OK

