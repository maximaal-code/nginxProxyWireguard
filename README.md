# Nginx Proxy with WireGuard

A simple setup for running Nginx proxy manager as a reverse proxy over a WireGuard VPN connection using Docker.

This makes it possible to connect the revere proxy to a docker network running in another location


## Dockerimage
Download the image from [dockerhub](https://hub.docker.com/repository/docker/maximaaldocker/nginxwireproxy/general)

```bash
docker pull maximaaldocker/nginxwireproxy:latest
```

## Example: Docker compose
An example `docker-compose.yml` is available in the test folder.

### Setup instructions

1. **Move into the test foler:** cd into the `test` folder

2. **WireGuard Config:**
    Copy your WireGuard client config into a file named `wg0.conf` in the `test` folder.
**Do not share this file**, as it contains sensitive information.

3. **Allowed IPs:**
    In your `wg0.conf`, set the **AllowedIPs** field to the subnet of the Docker network where your WireGuard server is connected.

Example:
```
AllowedIPs = 172.20.0.0/16
```
This ensures that only traffic destined for the specified subnet is routed through the VPN.


## Use case example
Suppose you have:

- A Docker bridge network named network_a on the remote side, with subnet 172.20.0.0/16
- A Django container connected to network_a with IP 172.20.0.10

If your AllowedIPs is set correctly, you can point Nginx Proxy Manager to 172.20.0.10. The traffic will then be routed securely through the VPN to the remote Docker network. 

For running a wireguard server I recommend the [linuxserver/wireguard](https://docs.linuxserver.io/images/docker-wireguard/) image.