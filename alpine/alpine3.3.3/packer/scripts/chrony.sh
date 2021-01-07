set -eux

/sbin/setup-ntp -c chrony

# Configure chrony to aggressively syncronize from virtual box wake
cat << 'EOF' > /etc/chrony/chrony.conf
# Disable NTP server
port 0
# Correct time on system startup
initstepslew 300 pool.ntp.org
# Recommended settings from
# https://chrony.tuxfamily.org/faq.html#_what_is_the_minimum_recommended_configuration_for_an_ntp_client
pool pool.ntp.org iburst
# Record the rate at which the system clock gains/losses time.
driftfile /var/lib/chrony/drift
# If the adjustment is larger than 1 seconds allow any number of steps to
# correct since running in VM
# https://chrony.tuxfamily.org/faq.html#_is_code_chronyd_code_allowed_to_step_the_system_clock
makestep 1 -1
# Enable kernel RTC synchronization.
rtcsync
EOF