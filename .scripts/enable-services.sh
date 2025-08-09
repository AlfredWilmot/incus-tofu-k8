#!/usr/bin/env sh

echo "starting incus daemon"
rc-update add incusd
rc-service incusd start

echo "starting cgroups service (required by podman)"
rc-update add cgroups
rc-service cgroups start
