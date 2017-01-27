# Rather than heavily modify setup-alpine, the steps that setup-alpine performs
# needed for Packer to SSH are performed here. Once the system is rebooted and
# Packer can SSH, the rest of setup-alpine's steps happen in scripts/setup.sh

set -exu

# Needed for setup scripts
PREFIX=

# Setup networking but don't start it because it was started earlier
cat << 'EOF' | /sbin/setup-interfaces -i
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    hostname alpine
EOF

cat << 'EOF' > /etc/hosts
127.0.0.1 alpine localhost localhost.localdomain
EOF

# Start networking on boot
rc-update --quiet add networking boot

# Setup APK repo now so we can install more things, use CDN for APKs
/sbin/setup-apkrepos http://dl-cdn.alpinelinux.org/alpine/v3.3/main

# Setup SSHD
/sbin/setup-sshd -c openssh

# Stop SSH so packer doesn't connect until we reboot
rc-service sshd stop

# Setup vagrant user so Packer can SSH
apk add --update sudo bash

adduser -D -s /bin/bash vagrant
adduser vagrant wheel

# Change vagrant user password to "vagrant"
echo 'vagrant:vagrant' | chpasswd

# Vagrant user needs to be able to sudo
cat << 'EOF' > /etc/sudoers
Defaults exempt_group=wheel
%wheel ALL=NOPASSWD:ALL
EOF

# Confirm erase of /dev/sda without prompt
export ERASE_DISKS=/dev/sda

# Copy the root system we just built to the disk
/sbin/setup-disk -s 0 -m sys /dev/sda

# Make sure /home/vagrant exist in our new disk
mount /dev/sda3 /mnt
cp -Rp /home/vagrant /mnt/home
umount /mnt

reboot
