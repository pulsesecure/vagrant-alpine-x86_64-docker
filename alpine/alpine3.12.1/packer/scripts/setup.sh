set -ux

# Need CA certs and ssl for wget to work
apk add openssl ca-certificates
update-ca-certificates

# Needed for setup scripts
PREFIX=

/sbin/setup-keymap us us
/sbin/setup-hostname -n alpine
/sbin/setup-timezone -z UTC

# Setup startup services
rc-update --quiet add urandom boot
for svc in acpid cron crond; do
	if rc-service --exists $svc; then
		rc-update --quiet add $svc
	fi
done

# Start up the services
openrc boot
openrc default
