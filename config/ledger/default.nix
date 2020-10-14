{ pkgs, config, ... }:
let
  home = config.home;
in
{
  home.file.".ledgerrc".text = ''
  --file=${home.homeDirectory}/.ledger/journal.ledger
  --input-date-format %Y-%m-%d
  --date-format %Y-%m-%d
  '';
}
