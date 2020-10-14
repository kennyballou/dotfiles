self: super:
{
  php-environment = super.buildEnv {
    name = "php-environment";
    ignoreCollisions = true;
    paths = [
      self.php
      self.phpPackages.composer
    ];
  };
}
