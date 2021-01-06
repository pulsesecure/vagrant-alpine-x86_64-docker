set -eux

rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

# dd will exit with error once disk is full, continue anyway
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY

sync
sync
sync
