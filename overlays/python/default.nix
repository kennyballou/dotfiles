self: super:
{
  python-environment = super.buildEnv {
    name = "python-environment";
    paths = [
      (self.python38.withPackages (
        ps: with ps; [
          flake8
          gprof2dot
          ipython
          matplotlib
          pandas
          pip
          pycodestyle
          pyflakes
          pygobject3
          pyparsing
          scipy
          setuptools
          virtualenv
          yamllint
        ]
      ))
      self.python-language-server
      self.setupcfg2nix
    ];
  };
}
