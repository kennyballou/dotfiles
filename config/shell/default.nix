{ pkgs, config, ... }:
{
  imports = [
    ./bash.nix
    ./zsh.nix
  ];

  home.file.".profile".text = ''
  #!/usr/bin/env sh

  . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"

  for i in "$${HOME}/.profile.d/"*.sh; do
        if [ -r "$${i}" ]; then
          . "$${i}" >/dev/null 2>&1
        fi
  done
  unset i
  '';
  home.file.".profile.d" = {
    recursive = true;
    source = ./profile.d;
  };

}
