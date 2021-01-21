{ pkgs, ...}:

pkgs.writeScriptBin "git_sync.py" (builtins.readFile ./git-sync.py)
