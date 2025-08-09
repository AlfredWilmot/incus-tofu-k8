#!/usr/bin/env sh
set -ex

apk update && apk upgrade
apk add --no-cache bash shadow

chsh -s /bin/bash

# logout for changes to take effect
