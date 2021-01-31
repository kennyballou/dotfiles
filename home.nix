{ pkgs, config, ... }:
let
  lib = pkgs.stdenv.lib;

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
        url = https://github.com/nix-community/emacs-overlay/archive/afc86a5f186ee00fe7411db9ceb84d3f861f2d1a.tar.gz;
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
