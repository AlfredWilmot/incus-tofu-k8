#!/usr/bin/env bash
set -e

VM_NAME="talos-vm"
ISO="talos-amd64.iso"
ISO_VOL="talos-iso-vol"
STORAGE_POOL="default"

# 1)
echo "preparing talos VM using incus"
incus init "${VM_NAME}" --empty --vm -c limits.cpu=4 -c limits.memory=4GiB -d root,size=50GiB

echo "import talos ISO into incus as storage vol"
incus storage volume import "${STORAGE_POOL}" "${ISO}" "${ISO_VOL}" --type=iso

echo "attach ISO storage vol to VM"
incus config device add "${VM_NAME}" "${ISO_VOL}" disk pool="${STORAGE_POOL}" source="${ISO_VOL}" boot.priority=10


# REFERENCES #

# 1)
# [incus vm from iso](https://linuxcontainers.org/incus/docs/main/howto/instances_create/#launch-a-vm-that-boots-from-an-iso)
# [talos system requirements](https://www.talos.dev/v1.10/introduction/system-requirements/)

