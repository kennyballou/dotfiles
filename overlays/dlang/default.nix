self: super:
{
  dlang-environment = super.buildEnv {
    name = "dlang-environment";
    paths = [
      self.dmd
      self.rdmd
    ];
  };
}
