{ pkgs, ... }:
{
  home.file.".wgetrc".text = ''
  ca_directory = "${pkgs.cacert}/etc/ssl/certs"
  ca_certificate = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
  '';
}
