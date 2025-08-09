#!/usr/bin/env bash
set -ex

DEPS=(
  git curl htop
  netcat-openbsd netcat-openbsd-doc
  stow vim tmux openssh-server openssh
  starship fzf
  mandoc man-pages openrc-doc openssh-doc
  incus incus-client incus-vm
  opentofu
  shellcheck
)

apk update && apk add --no-cache "${DEPS[@]}" && apk upgrade

# (linuxcontainers.org/incus/docs/main/installing/#linux)

# incus is available via the apk community repository 
sed -i '/\/community$/{s/^ *#//}' /etc/apk/repositories


rc-update add incusd
rc-service incusd start
