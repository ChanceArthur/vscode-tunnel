FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  binutils-arm-none-eabi \
  build-essential \
  curl \
  git \
  git-lfs \
  libpng-dev && \
  rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
  apt-get install -y nodejs

RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' \
  --output /tmp/vscode_cli.tar.gz && \
  tar -xf /tmp/vscode_cli.tar.gz -C /usr/local/bin && \
  rm /tmp/vscode_cli.tar.gz

RUN useradd -m -s /bin/bash vscode
USER vscode

ENTRYPOINT ["code", "tunnel", "--accept-server-license-terms", "--name", "vscode-container"]
