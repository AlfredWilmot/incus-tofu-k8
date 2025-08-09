#!/usr/bin/env bash

NET_CONF_FILE="/etc/network/interfaces"
NETMASK="255.255.255.0"
GATEWAY="192.168.0.1"
INTERFACE="eth0"
IPV4_REGEX="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" # crude, but good enough

DEFAULT_NET_CONF="$(cat <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
EOF
)"

if [[ ! "${1}" =~ ${IPV4_REGEX} ]]; then
  echo "Usage: ${0} [IPV4_ADDR]"
  echo "Set the static ip-addr of the host on ${INTERFACE}"
  exit 1
fi

HOST_IP="${1}"

echo "Applying the following config to ${NET_CONF_FILE}"
echo ""

cat <<EOF | tee "${NET_CONF_FILE}"
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address ${HOST_IP}
    netmask ${NETMASK}
    gateway ${GATEWAY}
EOF
echo ""

rc-service networking restart &> /dev/null
echo "done!"
