self: super:
let
  utils = pkgs: import ../../nix/utils.nix { pkgs = pkgs; };
  gtk3-emacs = (super.pkgs.emacs.override {
    withGTK3 = true;
    withGTK2 = false;
  });
  lucid-emacs = (super.pkgs.emacs.override {
    # enable lucid
    withGTK3 = false;
    withGTK2 = false;
  });
  ePackages = self.callPackage ./packages.nix { };
  emacsWithPackages = emacs:
    (self.emacsPackagesGen ((utils self.pkgs).optimizeForThisHost emacs)).emacsWithPackages
      (ePackages.emacs-package-list self.emacsPackages);

in {
  emacs-overlay = super.buildEnv {
    name = "emacs-overlay";
    ignoreCollisions = true;
    paths = [
      (emacsWithPackages gtk3-emacs)
      self.mu
      self.multimarkdown
      self.librsvg
    ];
  };
}
