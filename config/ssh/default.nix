{ pkgs, config, ... }:
{
  home.file.ssh = {
    recursive = true;
    source = ./ssh;
    target = ".ssh";
  };
}
