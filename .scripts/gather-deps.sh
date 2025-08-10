#!/usr/bin/env bash
set -e

DEPS=(
  git curl htop
  podman podman-compose
  netcat-openbsd netcat-openbsd-doc
  stow vim tmux openssh-server openssh
  starship fzf
  mandoc man-pages openrc-doc openssh-doc
  incus incus-client incus-vm
  libvirt-daemon qemu-img qemu-system-x86_64 qemu-modules openrc
  opentofu
  shellcheck
)

# incus is available via the apk community repository 
# (linuxcontainers.org/incus/docs/main/installing/#linux)
sed -i '/\/community$/{s/^ *#//}' /etc/apk/repositories

apk update && apk add --no-cache "${DEPS[@]}" && apk upgrade
