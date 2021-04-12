self: super:
{
  nix-tools = super.buildEnv {
    name = "nix-tools";
    ignoreCollisions = true;
    paths = with self;[
      nix-bash-completions
      nix-diff
      nix-index
      nix-prefetch-git
      nix-prefetch-github
      nix-review
      nix-top
      nix-zsh-completions
    ];
  };
}
