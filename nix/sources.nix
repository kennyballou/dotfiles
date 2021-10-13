{
  nixpkgs = {
    kb = builtins.fetchGit {
      url = "https://github.com/kennyballou/nixpkgs.git";
      ref = "override-erlang-emacs-mode";
      rev = "a730bb1666e7614071a0c7b1ed4dac5ba5d03753";
    };
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "ee084c02040e864eeeb4cf4f8538d92f7c675671";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "ee084c02040e864eeeb4cf4f8538d92f7c675671";
    };
  };
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
    rev = "d9fe208f3ccd7047a29eb31fd0cd3191c4445323";
  };
  emacs-overlay = {
    master = builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      rev = "a0c16aadd9b4a2d8cd32910c422c63f358c6609e";
    };
  };
}
