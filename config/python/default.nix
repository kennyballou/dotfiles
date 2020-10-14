{ pkgs, ... }:
{
  home.sessionVariables = {
    PYTHONPATH = "${pkgs.python-environment}/lib/python3.8/site-packages";
  };
}
