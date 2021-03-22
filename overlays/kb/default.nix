self: super:
{
  duplicity-backup-sh = super.callPackage ../../packages/scripts/duplicity-backup-sh {};
  gen-sshconfig-sh = super.callPackage ../../packages/scripts/gen-sshconfig-sh {};
  git-sync-py = super.callPackage ../../packages/scripts/git-sync-py {};
  install-git-hooks-sh = super.callPackage ../../packages/scripts/install-git-hooks-sh {};
  nix-search-emacs-packages-sh = super.callPackage ../../packages/scripts/nix-search-emacs-packages-sh {};
  shadir-sh = super.callPackage ../../packages/scripts/shadir-sh {};
  shreddir-sh = super.callPackage ../../packages/scripts/shreddir-sh {};
}
