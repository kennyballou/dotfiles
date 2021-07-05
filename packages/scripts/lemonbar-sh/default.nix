{ pkgs, ... }:

pkgs.writeScriptBin "lemon.sh" ''
#!${pkgs.bash}/bin/bash

exec ${pkgs.conky}/bin/conky --config="$HOME/.config/lemonbar/conky.lua" | \
     ${pkgs.lemonbar-xft}/bin/lemonbar -g "x24" \
                                       -u 2 \
                                       -B "#DD000000" \
                                       -F "#DDFFFFFF" \
                                       -f "InconsolataNerdFontMono:size=12" \
                                       -f "FontAwesome:size=12" | \
     ${pkgs.bash}/bin/sh &
''
