{ pkgs, config, ... }:
{
  xdg.configFile.profanity = {
    source = ./profrc;
    target = "profanity/profrc";
  };
}
