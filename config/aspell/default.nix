{ pkgs, config, ... }:
let
  xdg = config.xdg;
in
{
  home.file.".aspell.conf".text = ''
  lang en_US
  dict-dir ${pkgs.aspellDicts.en}/lib/aspell
  add-extra-dicts ${pkgs.aspellDicts.en-computers}/lib/aspell/en-computers.rws
  add-extra-dicts ${pkgs.aspellDicts.en-science}/lib/aspell/en_US-science.rws
  add-extra-dicts ${pkgs.aspellDicts.en-science}/lib/aspell/en_GB-science.rws
  personal ${xdg.configHome}/aspell/en_US.personal
  repl ${xdg.configHome}/aspell/en_US.repl
  '';
}
