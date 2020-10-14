self: super:
{
  ghc-environment = super.buildEnv {
    name = "ghc-environment";
    ignoreCollisions = true;
    paths = [
      self.ghc
      self.ghcid
      self.haskellPackages.ghcide
    ];
  };
}
