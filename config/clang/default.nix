{ config, ... }:
let
  home-dir = config.home.homeDirectory;
  nixpath = "${home-dir}/.nix-profile";
in
{
  home.sessionVariables = {
    C_INCLUDE_PATH = "${nixpath}/include";
    CPLUS_INCLUDE_PATH = "${nixpath}/include";
  };
}
