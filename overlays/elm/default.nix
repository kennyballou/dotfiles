self: super:
{
  elm-environment = super.buildEnv {
    name = "elm-environment";
    ignoreCollisions = true;
    paths = with self.elmPackages; [
      elm
      elm-format
      elm-test
    ];
  };
}
