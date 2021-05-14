{
  nixpkgs = {
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "94b2848559b12a8ed1fe433084686b2a81123c99";
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
      rev = "7224696fa76e02e6bd8266d3917960098a47a880";
    };
  };
}
