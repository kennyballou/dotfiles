#!/usr/bin/env sh

for i in "${HOME}/.profile.d/"*.sh; do
    if [ -r "${i}" ]; then
        # shellcheck source=/home/kb/.profile.d/20_local.sh
        . "${i}" >/dev/null 2>&1
    fi
done
unset i
