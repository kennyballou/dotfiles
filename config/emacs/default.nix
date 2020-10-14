{ pkgs, config, ... }:
{
  xdg.configFile.emacs-init = {
    source = ./emacs.d/init.el;
    target = "emacs/init.el";
  };
  xdg.configFile.emacs-lisp = {
    recursive = true;
    source = ./emacs.d/lisp;
    target = "emacs/lisp";
  };
  xdg.configFile.emacs-org-captures = {
    recursive = true;
    source = ./emacs.d/org-captures;
    target = "emacs/org-captures";
  };
  xdg.configFile.emacs-site-lisp = {
    recursive = true;
    source = ./emacs.d/site-lisp;
    target = "emacs/site-lisp";
  };
  xdg.configFile.emacs-snippets = {
    recursive = true;
    source = ./emacs.d/snippets;
    target = "emacs/snippets";
  };
  xdg.configFile.emacs-xml = {
    recursive = true;
    source = ./emacs.d/xml;
    target = "emacs/xml";
  };
  xdg.dataFile.emacsclient = {
    source = ./emacsclient.desktop;
    target = "applications/emacsclient.desktop";
  };
  home.sessionVariables = {
    EDITOR = "${pkgs.emacs-overlay}/bin/emacsclient -a";
  };
}
