# Nginx Proxy with WireGuard

A simple setup for running Nginx proxy manager as a reverse proxy over a WireGuard VPN connection using Docker.

This makes it possible to connect the revere proxy to a docker network running in another location


## Quickstart
Download the image from [dockerhub](https://hub.docker.com/repository/docker/maximaaldocker/nginxwireproxy/general)

```bash
docker pull maximaaldocker/nginxwireproxy:latest
```


 **WireGuard Configuration**: In `wg0.conf`, the `AllowedIPs = 172.20.0.0/16` setting is crucial. This ensures that only network packets destined for the specified subnet (e.g., `172.20.0.0/16`) are routed through the VPN. You must configure the subnet on the other side of the VPN to match this setting. This allows proper routing of traffic to machines on the other side of the VPN while keeping other traffic unaffected.