self: super:
{
  ml-environment = super.buildEnv {
    name = "ml-environment";
    ignoreCollisions = true;
    paths = [
      self.ocaml
    ];
  };
}
