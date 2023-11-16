#!/bin/sh -l

cf api "$INPUT_CF_API"
cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"

# This would install latest available --> moving target, potential issues
# cf install-plugin multiapps -f

# Safer: download a specific version of the plugin known to work with chosen ubuntu version
wget --quiet -O multiapps-plugin-v3.2.1.linux64 https://github.com/cloudfoundry/multiapps-cli-plugin/releases/download/v3.2.1/multiapps-plugin.linux64

# Install the plugin from the local file
cf install-plugin -f multiapps-plugin-v3.2.1.linux64

if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi

sh -c "cf $*"
