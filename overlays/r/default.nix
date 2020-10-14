self: super:
{
  r-environment = super.buildEnv {
    name = "r-environment";
    ignoreCollisions = true;
    paths = [
      self.R
    ];
  };
}
