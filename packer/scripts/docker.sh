set -eux

apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libseccomp
apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community docker

rc-update add docker boot
service docker start

# Add vagrant user to docker group
adduser vagrant docker

# Relax grsec for docker on reboot.
cat << 'EOF' > /etc/sysctl.conf
kernel.grsecurity.chroot_deny_chmod = 0
kernel.grsecurity.chroot_deny_mknod = 0
EOF
