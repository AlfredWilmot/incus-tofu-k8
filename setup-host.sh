#!/usr/bin/env sh
set -ex

SCRIPTS_DIR=".scripts"

./"${SCRIPTS_DIR}"/shell-setup.sh
./"${SCRIPTS_DIR}"/gather-deps.sh
