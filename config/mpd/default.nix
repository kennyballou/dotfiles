{ pkgs, config, ... }:
{
  home.sessionVariables = {
    MPD_HOST = "/run/user/$(id -u)/mpd/socket";
  };
  services.mpd = {
    enable = true;
    network.listenAddress = "any";
    extraConfig = ''
    audio_output {
        type "pulse"
        name "pulse-output"
    }
    '';
  };
}
