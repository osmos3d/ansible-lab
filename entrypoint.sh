#!/bin/sh
set -eu
if [ ! -f /keys/id_ed25519 ]; then
  ssh-keygen -q -t ed25519 -N '' -f /keys/id_ed25519
fi
chmod 600 /keys/id_ed25519
exec sleep infinity
