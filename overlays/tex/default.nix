self: super:
{
  texFull = super.buildEnv {
    name = "texFull";
    ignoreCollisions = true;
    paths = [
      self.pygmentex
      self.texlive.combined.scheme-full
    ];
  };
}
