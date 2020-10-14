self: super:
{
  nix-tools = super.buildEnv {
    name = "nix-tools";
    ignoreCollisions = true;
    paths = [
      self.nix-bash-completions
      self.nix-diff
      self.nix-index
      self.nix-prefetch-git
      self.nix-prefetch-github
      self.nix-review
      self.nix-top
      self.nix-zsh-completions
    ];
  };
}
