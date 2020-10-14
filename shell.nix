let
  sources = import ./nix/sources.nix;
  unstable = sources.nixpkgs.unstable;
  stable = sources.nixpkgs.stable;
  home-manager = sources.home-manager;

  pkgs = import unstable {};
in
pkgs.mkShell {
  name = "home-manager-shell";

  buildInputs = with pkgs; [
    git
    gnumake
    home-manager
    nixpkgs-fmt
  ];

  NIX_PATH =
    "nixpkgs=${unstable}:nixos=${stable}:home-manager=${home-manager}";
  HOME_MANAGER_CONFIG = "./home.nix";
}
