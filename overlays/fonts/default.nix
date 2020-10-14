self: super:
{
  fonts-overlay = super.buildEnv {
    name = "fonts-overlay";
    ignoreCollisions = true;
    paths = [
      self.carlito
      self.dejavu_fonts
      self.ipafont
      self.kochi-substitute
      self.noto-fonts
      self.source-code-pro
      self.symbola
      self.ttf_bitstream_vera
    ];
  };
}
