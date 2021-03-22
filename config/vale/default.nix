{ ... }:
{
  home.file.".vale.ini".source = ./vale.ini;
  xdg.configFile.vale = {
    recursive = true;
    target = "vale/styles";
    source = ./styles;
  };
}
