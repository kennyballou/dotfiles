self: super:
{
  beam-environment = super.buildEnv {
    name = "beam-environment";
    ignoreCollisions = true;
    paths = [
      self.elixir
      self.erlang
    ];
  };
}
