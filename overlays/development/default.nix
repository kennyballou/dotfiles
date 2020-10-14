self: super:
{
  development-tools = super.buildEnv {
    name = "development-tools";
    ignoreCollisions = true;
    paths = [
      self.autoconf
      self.autogen
      self.automake
      self.cmake
      self.cmake
      self.cppcheck
      self.doxygen
      self.gdb
      self.global
      self.gnum4
      self.gnumake
      self.lcov
      self.libtool
      self.ltrace
      self.pkgconfig
      self.strace
      self.valgrind
    ];
  };
}
