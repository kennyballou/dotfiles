# https://github.com/jwiegley/nix-config/blob/master/overlays/10-emacs.nix
{ pkgs, ... }:
let
  inherit (pkgs) fetchurl fetchgit fetchFromGitHub stdenv;

  withPatches = pkg: patches:
    pkg.OverrideAttrs(attrs: { inherit patches; });
  compileElispFiles = pkgs.callPackage ./builders/elisp.nix;
  fetchFromEmacsWiki = pkgs.callPackage ({ fetchurl, name, sha256 }:
    fetchurl {
      inherit sha256;
      url = "https://www.emacswiki.org/emacs/download/" + name;
    });
  compileEmacsWikiFile = { name, sha256, buildInputs ? [], patches ? [] }:
    compileElispFiles {
      inherit name buildInputs patches;
      src = fetchFromEmacsWiki { inherit name sha256; };
    };
in rec {
  ascii = compileEmacsWikiFile {
    name = "ascii.el";
    sha256 = "1ijpnk334fbah94vm7dkcd2w4zcb0l7yn4nr9rwgpr2l25llnr0f";
  };
  hexrgb = compileEmacsWikiFile {
    name = "hexrgb.el";
    sha256 = "18hb8brf7x92aidjfgczxangri6rkqq4x5d06lh41193f97rslm8";
  };

  palette = compileEmacsWikiFile {
    name = "palette.el";
    sha256 = "149y6bmn0njgq632m9zdnaaw7wrvxvfqndpqlgcizn6dwzixiih6";
    buildInputs = [ hexrgb ];
  };

  emacs-package-list = (epkgs: (with epkgs.melpaPackages; [
    add-node-modules-path
    ag
    alchemist
    anaconda-mode
    anti-zenburn-theme
    anzu
    auth-source-pass
    autodisass-java-bytecode
    avy
    bash-completion
    bind-key
    bnf-mode
    browse-kill-ring
    buffer-move
    bundler
    cider
    cljsbuild-mode
    clojure-mode
    coffee-mode
    company
    counsel
    counsel-projectile
    counsel-tramp
    coverlay
    css-eldoc
    csv
    d-mode
    dap-mode
    define-word
    diff-hl
    diminish
    direnv
    disable-mouse
    docker
    docker-compose-mode
    docker-tramp
    dockerfile-mode
    doom-themes
    editorconfig
    edts
    ein
    elein
    elfeed
    elfeed-org
    elixir-mode
    elm-mode
    erlang
    ess
    exec-path-from-shell
    expand-region
    f
    flycheck
    flycheck-clojure
    flycheck-color-mode-line
    flycheck-credo
    flycheck-elixir
    flycheck-elm
    flycheck-haskell
    flycheck-ledger
    flycheck-ocaml
    flycheck-rust
    fold-dwim
    forge
    fullframe
    geben
    geben-helm-projectile
    geiser
    git-auto-commit-mode
    git-commit
    git-timemachine
    gitconfig-mode
    gitignore-mode
    go-autocomplete
    go-eldoc
    go-mode
    go-stacktracer
    #goto-gem
    gnuplot
    graphviz-dot-mode
    guix
    gxref
    haml-mode
    haskell-mode
    helm
    helm-bbdb
    helm-bibtex
    helm-descbinds
    helm-flycheck
    helm-flyspell
    helm-gtags
    helm-lsp
    helm-mu
    helm-pass
    helm-projectile
    helm-rg
    helm-sql-connect
    helm-tramp
    helm-wordnet
    helm-xref
    highlight-escape-sequences
    #hindent
    htmlize
    hydra
    ibuffer-vc
    import-js
    inf-ruby
    ivy
    jedi
    js-comint
    js2-mode
    json-mode
    ledger-mode
    less-css-mode
    list-unicode-display
    lsp-haskell
    lsp-mode
    lsp-java
    lsp-ui
    magit
    markdown-mode
    mbsync
    mmm-mode
    modus-themes
    mpdel
    multiple-cursors
    mwim
    nix-buffer
    nix-mode
    nix-update
    ob-elixir
    ob-go
    ob-ipython
    ob-mongo
    olivetti
    org-babel-eval-in-repl
    org-cliplink
    org-gcal
    org-pomodoro
    org-projectile
    org-ref
    org-sync
    ox-gfm
    page-break-lines
    pass
    pcmpl-args
    pcmpl-git
    pcmpl-pip
    pcomplete-extension
    pdf-tools
    peep-dired
    php-mode
    pip-requirements
    polymode
    projectile
    racer
    rainbow-delimiters
    realgud
    realgud-jdb
    regex-tool
    robe
    rspec-mode
    ruby-compilation
    ruby-hash-syntax
    rust-mode
    sass-mode
    scss-mode
    session
    skewer-less
    skewer-mode
    smartparens
    smex
    smooth-scrolling
    solarized-theme
    spacemacs-theme
    spaceline
    swiper
    swiper-helm
    switch-window
    tagedit
    toml-mode
    tuareg
    typescript-mode
    unfill
    unicode-fonts
    unicode-whitespace
    use-package
    virtualenvwrapper
    wgrep-ag
    which-key
    whitespace-cleanup-mode
    whole-line-or-region
    with-editor
    xref-js2
    yari
    yasnippet
    zenburn-theme
  ]) ++ (with epkgs.elpaPackages; [
    auctex
    pinentry
    python
    rainbow-mode
    spinner
    undo-tree
  ]) ++ (with epkgs.melpaStablePackages; [
  ]) ++ [
    ascii
    hexrgb
  ]);
}
