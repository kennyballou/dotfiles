{
  nixpkgs = {
    unstable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "6dbcdd2bc19d4377a250c73e658445426de64957";
    };
    stable = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "c11f75bd73e8264bbca6f4bc969ccc39cd371196";
    };
  };
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
    rev = "87e2ec341bfda373d50ab58529b4bbb0eb9eb9a0";
  };
}
