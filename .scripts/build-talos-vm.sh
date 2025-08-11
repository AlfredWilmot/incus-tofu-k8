#!/usr/bin/env bash
set -e

VM_NAME="talos-vm"
ISO_PATH="talos-amd64.iso"
ISO_VOL="talos-iso-vol"
ISO_URL="https://factory.talos.dev/image/376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba/v1.10.6/metal-amd64.iso"
ISO_SHA="f8d38dddbd74e32853980a1775f67d65b7cd43a88b3134abe900ac21705f085b"
STORAGE_POOL="default"

if [ ! -f "${ISO_PATH}" ]; then
  curl -o "${ISO_PATH}" "${ISO_URL}"
fi

if [ "${ISO_SHA}" != "$(sha256sum "${ISO_PATH}" | awk '{print $1}')" ]; then
  echo "WARNING: '${ISO_PATH}' has an unexpected SHA256SUM!"
  exit 1
fi

# 1)
echo "preparing talos VM using incus"
incus init "${VM_NAME}" \
	--empty --vm \
	-c limits.cpu=4 -c limits.memory=4GiB -c security.secureboot=false \
	-d root,size=50GiB

echo "import talos ISO into incus as storage vol"
incus storage volume import "${STORAGE_POOL}" "${ISO_PATH}" "${ISO_VOL}" --type=iso

echo "attach ISO storage vol to VM"
incus config device add "${VM_NAME}" "${ISO_VOL}" disk pool="${STORAGE_POOL}" source="${ISO_VOL}" boot.priority=10

cat <<EOF
# Next steps #

# interact with the VM's boot-menu:
incus start ${VM_NAME} --console

# detach the ISO volume from the storage pool
incus storage volume detach ${STORAGE_POOL} ${ISO_VOL} ${VM_NAME}

EOF


# REFERENCES #

# 1)
# [incus vm from iso](https://linuxcontainers.org/incus/docs/main/howto/instances_create/#launch-a-vm-that-boots-from-an-iso)
# [talos system requirements](https://www.talos.dev/v1.10/introduction/system-requirements/)

