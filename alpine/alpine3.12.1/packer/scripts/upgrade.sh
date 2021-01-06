set -ux

apk upgrade -U --available

# Install dependencies needed by vagrant so we don't have to do it at runtime
apk add dnsmasq nfs-utils rsync
