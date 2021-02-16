self: super:
{
  fonts-overlay = super.buildEnv {
    name = "fonts-overlay";
    ignoreCollisions = true;
    paths = with self; [
      carlito
      dejavu_fonts
      hack-font
      inconsolata-nerdfont
      ipafont
      kochi-substitute
      noto-fonts
      source-code-pro
      symbola
      ttf_bitstream_vera
    ];
  };
}
