{ pkgs, config, ... }:
{
  home.file.".curlrc".text = ''
  capath=${pkgs.cacert}/etc/ssl/certs/"
  cacert=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt
  '';
}
