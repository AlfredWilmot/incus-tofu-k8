#!/usr/bin/env sh

echo "installing bash and configuring it as the login shell"
apk update && apk upgrade
apk add --no-cache bash shadow

chsh -s /bin/bash

# logout for changes to take effect
