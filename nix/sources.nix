{
  nixpkgs = {
    kb = builtins.fetchGit {
      url = "https://github.com/kennyballou/nixpkgs.git";
      ref = "override-erlang-emacs-mode";
      rev = "a730bb1666e7614071a0c7b1ed4dac5ba5d03753";
    };
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "28d58b979250ef33f049fe1c74daa50b7515126b";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "47b35f569e84eb6dbbcf0a9fc75d8729ab8837fd";
    };
  };
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
    rev = "8e7a10602d1eb1d242c9d3f9b822203d5751a8c6";
  };
  emacs-overlay = {
    master = builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      rev = "f3c435a5e5cfa3ce1b2f50ba37b9cacfec4139d9";
    };
  };
}
