self: super:
{
  js-environment = super.buildEnv {
    name = "js-environment";
    ignoreCollisions = true;
    paths = [
      self.nodePackages.csslint
      self.nodePackages.eslint
      self.nodePackages.js-beautify
      self.nodejs
      self.yarn
    ];
  };
}
