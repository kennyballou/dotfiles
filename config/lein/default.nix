{ pkgs, config, ... }:
{
  home.file.".lein" = {
    recursive = true;
    source = ./lein;
  };
}
