#!/bin/bash

# This will run the dev container until further configured



podman run -d \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e PASSWORD=password `#optional` \
  -e HASHED_PASSWORD= `#optional` \
  -e SUDO_PASSWORD=password `#optional` \
  -e SUDO_PASSWORD_HASH= `#optional` \
  -e PROXY_DOMAIN=code-server.my.domain `#optional` \
  -p 8443:8443 \
  -v ~/code/config:/config \
  --restart unless-stopped \
  registry.home.local/code-server:version-v3.11.0-dev