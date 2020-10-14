{ pkgs, config, ... }:
{
  home.file.".bashrc".source = ./bashrc;
  home.file.".bash_profile".source = ./bash_profile;
}
