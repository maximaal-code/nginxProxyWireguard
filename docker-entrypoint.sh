#!/bin/bash

# Start WireGuard
echo "Starting WireGuard..."
wg-quick up wg0 || {
  echo "Failed to start WireGuard tunnel"
  exit 1
}

# Hand over to original entrypoint script (starts NPM)
echo "Starting Nginx Proxy Manager..."
exec /init