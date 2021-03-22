{ pkgs, config, ... }:
let
  lib = pkgs.lib;

  utils = import ./nix/utils.nix { pkgs = pkgs; };
  home-dir = builtins.getEnv "HOME";
  xdg = config.xdg;
  nixpath = "${home-dir}/.nix-profile";
  sources = import ./nix/sources.nix;
in
{
  nixpkgs = {
    config = import ./config/nixpkgs/config.nix;
    overlays = [
      (import sources.emacs-overlay.stable)
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
