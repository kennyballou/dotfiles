{ ... }:
{
  xdg.configFile.nix-config = {
    source = ./config.nix;
    target = "nixpkgs/config.nix";
  };
}
