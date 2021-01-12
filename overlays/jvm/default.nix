self: super:
let
  utils = import ../../nix/utils.nix { pkgs = self.pkgs; };
  optimizeJDK = jdk: utils.optimizeForThisHost jdk;
in {
  jvm-environment8 = optimizeJDK super.openjdk8;

  jvm-environment11 = optimizeJDK super.openjdk11;

  jvm-environment = optimizeJDK super.openjdk15;
}
