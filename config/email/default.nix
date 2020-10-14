{ config, ... }:
{
  accounts.email = {
    maildirBasePath = "${config.home.homeDirectory}/.mail";
  };
  programs.mbsync.enable = true;
  programs.mu.enable = true;
  programs.msmtp.enable = true;
}
