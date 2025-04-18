FROM jc21/nginx-proxy-manager:latest

# Install wireguard tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wireguard \
        iproute2 \
        iptables \
        openresolv \
        iputils-ping \
        curl \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# COPY wg0.conf /etc/wireguard/wg0.conf (or mount it later)

# Set up script to start WireGuard on container start
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Override the default entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]