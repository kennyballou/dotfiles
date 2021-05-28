{
  nixpkgs = {
    kb = builtins.fetchGit {
      url = "https://github.com/kennyballou/nixpkgs.git";
      ref = "override-erlang-emacs-mode";
      rev = "a730bb1666e7614071a0c7b1ed4dac5ba5d03753";
    };
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "84aa23742f6c72501f9cc209f29c438766f5352d";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "c11f75bd73e8264bbca6f4bc969ccc39cd371196";
    };
  };
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
    rev = "91418d3e57e96dc9f520931401c653becd33b4a4";
  };
  emacs-overlay = {
    master = builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      rev = "5df3462dda05d8e44669cf374776274e1bc47d0a";
    };
  };
}
