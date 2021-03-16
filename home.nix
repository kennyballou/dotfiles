{ pkgs, config, ... }:
let
  lib = pkgs.lib;

  utils = import ./nix/utils.nix { pkgs = pkgs; };
  home-dir = builtins.getEnv "HOME";
  xdg = config.xdg;
  nixpath = "${home-dir}/.nix-profile";
in
{
  nixpkgs = {
    config = import ./config/nixpkgs/config.nix;
    overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/nix-community/emacs-overlay/archive/dc7b0dc373cd09dd7274c6f571692a2985aff623.tar.gz;
      }))
    ] ++ utils.importDirs ./overlays;
  };
  imports = (utils.importDirs ./config) ++ [
    ./config/xresources/dpi-96.nix
    ./config/email/devnulllabs.nix
    ./config/email/boisestate.nix
  ];
  programs.home-manager.enable = true;
  home = {
    extraOutputsToInstall = [ "doc" "info" "devdoc" "man"];
    packages = (import ./packages.nix pkgs);
    sessionPath = [
      "${home-dir}/.local/bin"
    ];
  };
  systemd.user.sessionVariables = config.home.sessionVariables;
}
