{ config, ... }:
{
  services.kdeconnect = {
    enable = false;
    indicator = false;
  };
}
