{ pkgs, config, ... }:
{
  xdg.configFile.gitconfig = {
    source = ./git/config;
    target = "git/config";
  };
  xdg.configFile.gitignore = {
    source = ./git/global-ignore;
    target = "git/global-ignore";
  };
  xdg.configFile.gitk = {
    source = ./git/gitk;
    target = "git/gitk";
  };
  xdg.configFile.template = {
    recursive = true;
    source = ./git/template.d;
    target = "git/template.d";
  };
}
