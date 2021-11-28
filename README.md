# Code Server

A docker instance of VS Code for remote development within a containerized environment.
This repository is for custom baking the image for use in a kubernetes environment to which the nodes have access to the .kube resources in order to run 'kubectl' from the nodes and then inherently the vscode instance. 

## Purpose
Browser accessible VSCode instances that break-down the development environment to suit the needs of the human operator.
Leveraging larger infrastrcture such as servers instead of consuming resources on individual laptops/desktops.
Multiple instances can be deployed to a cluster/environment for many operators. Any one instance can be accessed by multiple operators if allowed. 

## Image Flavors

### Base
This is considered a subset of tooling that I find valuable in deploying to a cluster/environment in order to setup infrastructure and orchestation.
Tooling added:
- Flux CLI
- Helm
- Kubectl

### Dev
This is a image that I use for some basic development with Go & React (NodeJS). This image extends base such that kubectl and other tools would also be avalable.
Currently installing Nodejs from the apt package manager and Additional tools via manifest
Tooling added:
- Go 1.17.3


## Extensions pre-installation

Extensions will be pre-installed during the image build. Code server has a CLI for installing extensions.

## K8s Orchestration
I orchestrate this image through the `https://nicholaswilde.github.io/helm-charts/` code-server chart.
This can be seen orchestrated on my reconciliation repository [here](https://github.com/brandtkeller/toolchain-template/tree/main/clusters/dev/cicd/code-server)

## Local Development
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

## TODO
- Gather all binaries via manifest declarations
- Get sha hashes for binaries
- Create script for 
- Add tooling to dockerfile