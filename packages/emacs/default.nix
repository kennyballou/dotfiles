{ pkgs ? import <nixpkgs> { }, ... }:
let
  utils = import ../../nix/utils.nix { pkgs = pkgs; };
  gtk3-emacs = (pkgs.emacs.override {
    withGTK3 = true;
    withGTK2 = false;
  });
  lucid-emacs = (pkgs.emacs.override {
    # enable lucid
    withGTK3 = false;
    withGTK2 = false;
  });
  ePackages = pkgs.callPackage ./packages.nix { };
  emacsWithPackages = emacs:
    (pkgs.emacsPackagesFor emacs).emacsWithPackages
      (ePackages.emacs-package-list pkgs.emacsPackages);

in
  emacsWithPackages gtk3-emacs
