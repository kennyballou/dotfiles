{ pkgs, config, ... }:
{
  home.file.".muttrc".source = ./muttrc;

  home.file.".mutt" = {
    recursive = true;
    source = ./mutt;
  };
}
