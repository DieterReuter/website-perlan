#!/bin/bash

if [ "$(uname -s)" == "Darwin" ]; then
  # dev machine
  CADDYFILE="Caddyfile"
else
  # prod machine
  CADDYFILE="Caddyfile.tls"
fi
(cd website && caddy -agree=true -email="dieter.reuter@me.com" -conf=../${CADDYFILE} -log=stderr)
