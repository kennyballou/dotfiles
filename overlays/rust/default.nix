self: super:
{
  rust-environment = super.buildEnv {
    name = "rust-environment";
    ignoreCollisions = true;
    paths = [
      self.cargo
      self.cargo-update
      self.cargo2nix
      self.rls
      self.rustc
      self.rustracer
    ];
  };
}
