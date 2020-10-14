#!/usr/bin/env bash
# conky json output for i3status

# Send i3 header
echo '{"version": 1}'

# Start and prime infinite array
echo '[[],'

exec conky --config ${HOME}/.config/i3/$(hostname).i3bar.conkyrc
