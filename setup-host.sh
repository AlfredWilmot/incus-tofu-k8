#!/usr/bin/env sh
set -ex

SCRIPTS_DIR=".scripts"

(
  cd "${SCRIPTS_DIR}"

  ./shell-setup.sh
  ./gather-deps.sh
  ./enable-services.sh
 )
