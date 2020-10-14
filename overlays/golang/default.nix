self: super:
{
  golang-environment = super.buildEnv {
    name = "golang-environment";
    ignoreCollisions = true;
    paths = [
      self.delve
      self.glide
      self.go
      self.go-bindata
      self.go2nix
      self.gocode
      self.godef
      self.golint
      self.gopls
      self.gotools
    ];
  };
}
