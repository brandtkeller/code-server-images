ARG BASE_REGISTRY=ghcr.io
ARG BASE_IMAGE=linuxserver/code-server
ARG BASE_TAG=version-v3.11.0
FROM $BASE_REGISTRY/$BASE_IMAGE:$BASE_TAG

# Apt cleanup procedures
RUN sudo apt clean && sudo rm -rf /var/lib/apt/lists/* && sudo apt clean && apt update -y

# Install CLI tools
RUN sudo apt-get install -y kubectl helm python3-pip

# Instal FLux
RUN curl -s https://toolkit.fluxcd.io/install.sh | sudo bash


# Install extensions
# RUN code-server --install-extension vscjava.vscode-maven || echo "Problem installing Maven extension"

# Hardcoded git configuration - parameterize this
RUN git config --global user.email info@brandtkeller.net && git config --global user.name brandtkeller
RUN sudo echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc  