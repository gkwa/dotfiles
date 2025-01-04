#!/usr/bin/env bash

# https://cloud.google.com/sdk/docs/quickstarts

file=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
# shellcheck source=/dev/null
[ -f "$file" ] && . "$file"

file=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
# shellcheck source=/dev/null
[ -f "$file" ] && . "$file"
