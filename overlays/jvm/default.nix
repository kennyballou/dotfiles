self: super:
let
  utils = import ../../nix/utils.nix { pkgs = self.pkgs; };
  optimizeJDK = jdk: utils.optimizeForThisHost jdk;
  mkMaven = jdk: (super.pkgs.maven.override {
    jdk = jdk;
  });
  mkLeiningen = jdk: (super.pkgs.leiningen.override {
    jdk = jdk;
  });
  mkJVMEnv = jdk: name:
    super.buildEnv {
      name = name;
      ignoreCollisions = true;
      paths = [
        self.ammonite
        self.aspectj
        self.clj-kondo
        self.eclipses.eclipse-java
        self.jetbrains.idea-community
        self.jmeter
        jdk
        self.visualvm
      ];
    };
in {
  jvm-environment8 = mkJVMEnv (optimizeJDK self.openjdk8) "jvm-environment8";

  jvm-environment11 = mkJVMEnv (optimizeJDK self.openjdk11) "jvm-environment11";

  jvm-environment14 = mkJVMEnv (optimizeJDK self.openjdk14) "jvm-environment14";
}
