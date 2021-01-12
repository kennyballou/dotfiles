{ ... }:
let
  home = builtins.getEnv "HOME";
in
{
  xdg.userDirs = {
    enable = true;
    desktop = "${home}/desktop";
    documents = "${home}/documents";
    download = "${home}/downloads";
    music = "${home}/music";
    pictures = "${home}/pictures";
    publicShare = "${home}/public";
    templates = "${home}/templates";
    videos = "${home}/videos";
  };
}
