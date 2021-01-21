{ pkgs, ... }:

pkgs.writeScriptBin "gen-sshconfig" (builtins.readFile ./gen-sshconfig.sh)
