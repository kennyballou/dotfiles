{ pkgs, config, ... }:
let
  emacs-dir = "${config.home.homeDirectory}/.config/emacs";
in
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
  xdg.configFile.emacs-lsp-java = {
    recursive = true;
    source = ./emacs.d/lsp-java;
    target = "emacs/lsp-java";
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
  xdg.configFile.emacs-schemas = {
    target = "emacs/schemas.xml";
    text = ''
    <?xml version="1.0"?>
    <locatingRules xmlns="http://thaiopensource.com/ns/locating-rules/1.0">
        <uri pattern="pom.xml" uri="file://${emacs-dir}/xml/maven-v4_0_0.rnc"/>
        <uri pattern="build.xml" uri="file://${emacs-dir}/xml/ant-1.8.2.rnc"/>
        <uri ns="http://docbook.org/ns/docbook"
             uri="${pkgs.docbook5}/share/xml/docbook-5.0/rng/docbookxi.rnc"/>
    </locatingRules>
    '';
  };
  xdg.dataFile.emacsclient = {
    source = ./emacsclient.desktop;
    target = "applications/emacsclient.desktop";
  };
  home.sessionVariables = {
    EDITOR = "${pkgs.emacs-overlay}/bin/emacsclient -a";
  };
}
