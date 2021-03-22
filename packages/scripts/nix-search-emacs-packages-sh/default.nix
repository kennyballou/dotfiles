{ pkgs, ... }:

pkgs.writeScriptBin "nix-search-emacs" ''
#!${pkgs.bash}/bin/bash

exec ${pkgs.nix}/bin/nix-env -f "<nixpkgs>" -qaP -A emacsPackages | ${pkgs.fzf}/bin/fzf
''
