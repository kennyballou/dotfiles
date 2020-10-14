self: super:
{
  scheme-environment = super.buildEnv {
    name = "scheme-environment";
    ignoreCollisions = true;
    paths = [
      self.guile
      self.guile-lint
      self.racket
    ];
  };
}
