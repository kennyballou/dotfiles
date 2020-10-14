{ pkgs, config, ... }:
{
  home.file.".weechat" = {
    recursive = true;
    source = ./weechat;
  };
}
