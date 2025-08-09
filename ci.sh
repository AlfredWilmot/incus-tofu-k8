#!/usr/bin/env bash

if ! tofu fmt -recursive -check &> /dev/null; then
	echo "Formatting all *.tf files"
	tofu fmt -recursive -diff
else
	echo "All *.tf files are already formatted."
fi
