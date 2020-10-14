{ ... }:
{
  xdg.configFile.nix-config = {
    source = ./config.nix;
    target = "nixpkgs/config.nix";
  };
  xdg.configFile.overlays = {
    recursive = true;
    source = ../../overlays;
    target = "nixpkgs/overlays";
  };
}
