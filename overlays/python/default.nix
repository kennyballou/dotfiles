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
          pip
          pycodestyle
          pyflakes
          pygobject3
          pyparsing
          python-language-server
          setuptools
          virtualenv
          yamllint
        ]
      ))

      self.setupcfg2nix
    ];
  };
}
