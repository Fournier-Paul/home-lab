FROM grafana/promtail:2.9.0

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl dnsutils \
 && rm -rf /var/lib/apt/lists/*
