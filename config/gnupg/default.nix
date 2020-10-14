{ pkgs, config, accounts, ... }:
{
  programs.gpg = {
    enable = true;
    settings = {
      keyserver = "hkp://keys.gnupg.net:80";
      use-agent = true;
      default-key = "932F3E8E1C0F4A9895D7B8B8B0CAA28A02958308";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 28800;
    maxCacheTtl = 43200;
    extraConfig = ''
    allow-emacs-pinentry
    allow-loopback-pinentry
    '';
  };
}
