{ pkgs, config, ... }:
{
  home.file.maven-toolchains = {
    target = ".m2/toolchains.xml";
    text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <toolchains>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>8</version>
          <vendor>OpenJDK</vendor>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk8}</jdkHome>
        </configuration>
      </toolchain>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>9</version>
          <vendor>OpenJDK</vendor>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk11}</jdkHome>
        </configuration>
      </toolchain>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>16</version>
          <vendor>OpenJDK</vendor>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk16}</jdkHome>
        </configuration>
      </toolchain>
    </toolchains>
    '';
  };
}
