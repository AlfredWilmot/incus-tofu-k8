#!/usr/bin/env bash
# Run static analysis tools on source code
set -e

# TERRAFORM

if ! tofu fmt -recursive -check &> /dev/null; then
  echo "Formatting all *.tf files"
  tofu fmt -recursive -diff
else
  echo "All *.tf files are formatted."
fi

# BASH

SHELL_SCRIPTS="$(find . -name "*.sh")"
for script in ${SHELL_SCRIPTS}; do
  shellcheck --extended-analysis=true "${script}"
done
echo "All shell scripts pass static analysis."
