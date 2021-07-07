{
  nixpkgs = {
    kb = builtins.fetchGit {
      url = "https://github.com/kennyballou/nixpkgs.git";
      ref = "override-erlang-emacs-mode";
      rev = "a730bb1666e7614071a0c7b1ed4dac5ba5d03753";
    };
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "3e0ce8c5d478d06b37a4faa7a4cc8642c6bb97de";
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
      rev = "bfc8f6edcb7bcf3cf24e4a7199b3f6fed96aaecf";
    };
  };
}
