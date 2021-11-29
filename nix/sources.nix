{
  nixpkgs = {
    kb = builtins.fetchGit {
      url = "https://github.com/kennyballou/nixpkgs.git";
      ref = "override-erlang-emacs-mode";
      rev = "a730bb1666e7614071a0c7b1ed4dac5ba5d03753";
    };
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "509d236edf0056d05547c776140fe7cfcf2305bd";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "47b35f569e84eb6dbbcf0a9fc75d8729ab8837fd";
    };
  };
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
    rev = "a28cf79a78040b4e6d8d50a39760a296d5e95dd6";
  };
  emacs-overlay = {
    master = builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      rev = "3cce9efcab327431468356af76caa2226599de2f";
    };
  };
}
