{ pkgs, ... }:

pkgs.writeScriptBin "install-git-hooks.sh" (builtins.readFile ./install-git-hooks.sh)
