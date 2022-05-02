#!/bin/sh

if [ $# = 0 ]; then
  tailscaled &
  derper -a :4433 --verify-clients &
  wait -n
  exit $?
else
  exec "$@"
fi
