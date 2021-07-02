self: super:
{
  backup-sh = super.callPackage ../../packages/scripts/backup-sh {};
  duplicity-backup-sh = super.callPackage ../../packages/scripts/duplicity-backup-sh {};
  kopia-snapshot-sh = super.callPackage ../../packages/scripts/kopia-snapshot-sh {};
  gen-sshconfig-sh = super.callPackage ../../packages/scripts/gen-sshconfig-sh {};
  git-sync-py = super.callPackage ../../packages/scripts/git-sync-py {};
  install-git-hooks-sh = super.callPackage ../../packages/scripts/install-git-hooks-sh {};
  nix-search-emacs-packages-sh = super.callPackage ../../packages/scripts/nix-search-emacs-packages-sh {};
  shadir-sh = super.callPackage ../../packages/scripts/shadir-sh {};
  shreddir-sh = super.callPackage ../../packages/scripts/shreddir-sh {};
}
