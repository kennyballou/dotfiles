self: super:
{
  cpp-environment = super.buildEnv {
    name = "cpp-environment";
    ignoreCollisions = true;
    paths = [
      self.boost
      self.gcc
      self.libcxx
      self.libcxxabi
      self.stdman
    ];
  };
}
