self: super:
{
  git-tools = super.buildEnv {
    name = "git-tools";
    ignoreCollisions = true;
    paths = [
      self.gitAndTools.delta
      self.gitAndTools.git-crypt
      #self.gitAndTools.gitFastExport
      self.gitAndTools.pass-git-helper
      self.gitAndTools.tig
      self.gitFull
      self.gitstats
    ];
  };
}
