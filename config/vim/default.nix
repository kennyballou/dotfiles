{ pkgs, config, ... }:
{
  home.file.".vimrc".source = ./vimrc;
  home.file.".gvimrc".source = ./gvimrc;
  home.file.".vim" = {
    recursive = true;
    source = ./vim;
  };
}
