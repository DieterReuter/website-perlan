#!/bin/bash
CADDY_VERSION="v0.8.2"

if [ "$(uname -s)" == "Darwin" ]; then
  # dev machine: OS X
  CADDY_FILE="Caddyfile"

  # download Caddy binary
  if [ ! -f "caddy_darwin_amd64.zip" ]; then
    wget https://github.com/mholt/caddy/releases/download/${CADDY_VERSION}/caddy_darwin_amd64.zip
  fi
else
  # prod machine: Linux ARMv7, Scaleway C1
  CADDY_FILE="Caddyfile.tls"

  # download Caddy binary
  if [ ! -f "caddy_linux_arm.tar.gz" ]; then
    wget https://github.com/mholt/caddy/releases/download/${CADDY_VERSION}/caddy_linux_arm.tar.gz
  fi
fi

# start Caddy webserver
(cd website && caddy -agree=true -email="dieter.reuter@me.com" -conf=../${CADDY_FILE} -log=stderr)
