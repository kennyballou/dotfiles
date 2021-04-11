{
  nixpkgs = {
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "b49e47309d0df845ce3eb6c01ffe720952ed3695";
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
      rev = "dc7b0dc373cd09dd7274c6f571692a2985aff623";
    };
  };
}
