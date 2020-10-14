self: super:
{
  clang-environment = super.buildEnv {
    name = "clang-environment";
    ignoreCollisions = true;
    paths = [
      self.clang
      self.clang-tools
      self.llvm
    ];
  };
}
