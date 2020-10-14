{ pkgs, config, ... }:
{
  home.file.".zshrc".source = ./zshrc;
  home.file.".zshenv".source = ./zshenv;
}
