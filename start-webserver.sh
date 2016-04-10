#!/bin/bash

(cd website && caddy -agree=true -conf=../Caddyfile -log=stderr)
