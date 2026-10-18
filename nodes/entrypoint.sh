#!/bin/sh
set -eu
while [ ! -s /keys/id_ed25519.pub ]; do
  sleep 1
done
cp /keys/id_ed25519.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
ssh-keygen -A >/dev/null
exec /usr/sbin/sshd -D -e
