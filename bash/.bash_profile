#!/usr/bin/env bash
# shellcheck source=/home/kb/.bashrc
[[ -f ~/.bashrc ]] && source "${HOME}/.bashrc"

for i in "${HOME}/.profile.d/"*.sh; do
    if [[ -r "$i" ]]; then
        source "$i" >/dev/null 2>&1
    fi
done
unset i
