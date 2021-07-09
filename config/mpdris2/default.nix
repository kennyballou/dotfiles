{ config, ... }:
{
  services.mpdris2 = {
    enable = true;
    mpd = {
      host = "/run/user/1000/mpd/socket";
      port = 6600;
    };
    multimediaKeys = true;
    notifications = false;
  };
}
