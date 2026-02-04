.PHONY: up-monitoring down-monitoring up-nextcloud down-nextcloud up-jeedom down-jeedom config

up-monitoring:
	docker compose -f stacks/monitoring/compose.yml up -d

down-monitoring:
	docker compose -f stacks/monitoring/compose.yml down

up-nextcloud:
	docker compose -f stacks/nextcloud/compose.yml up -d

down-nextcloud:
	docker compose -f stacks/nextcloud/compose.yml down

up-jeedom:
	docker compose -f stacks/jeedom/compose.yml up -d

down-jeedom:
	docker compose -f stacks/jeedom/compose.yml down

config:
	docker compose -f stacks/monitoring/compose.yml config >/dev/null
	docker compose -f stacks/nextcloud/compose.yml config >/dev/null
	docker compose -f stacks/jeedom/compose.yml config >/dev/null
