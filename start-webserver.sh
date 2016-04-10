#!/bin/bash
CADDY_VERSION="v0.8.2"

if [ "$(uname -s)" == "Darwin" ]; then
  # dev machine: OS X
  CADDY_FILE="Caddyfile"
  CADDY_ARCHIVE="caddy_darwin_amd64.zip"
else
  # prod machine: Linux ARMv7, Scaleway C1
  CADDY_FILE="Caddyfile.tls"
  CADDY_ARCHIVE="caddy_linux_arm.tar.gz"
fi

# download Caddy binary
if [ "$(which caddy)" != "/usr/local/bin/caddy" ]; then
  if [ ! -f "${CADDY_ARCHIVE}" ]; then
    wget https://github.com/mholt/caddy/releases/download/${CADDY_VERSION}/${CADDY_ARCHIVE}
  fi
  tar xvf ${CADDY_ARCHIVE} caddy
  mv caddy /usr/local/bin/
fi

# start Caddy webserver
caddy --version
(cd website && caddy -agree=true -email="dieter.reuter@me.com" -conf=../${CADDY_FILE} -log=stderr)
