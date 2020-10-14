{ pkgs, config, ... }:
{
  home.file.".guile".source = ./guile.scm;
}
