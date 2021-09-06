{ pkgs, ... }:
# https://stackoverflow.com/questions/42136197/how-to-override-compile-flags-for-a-single-package-in-nixos
# https://nixos.wiki/wiki/Snippets
let

  overrideWithFlag = pkg: flag:
    pkg.overrideAttrs (attrs: {
      NIX_CFLAGS_COMPILE = (attrs.NIX_CFLAGS_COMPILE or "") + "${flag}";
    });
  overrideWithFlags = pkg: flags: pkgs.lib.foldl' (pkg: flag: overrideWithFlag pkg flag) pkg flags;
in
{
  overrideWithFlags = overrideWithFlags;
  optimizeForThisHost = pkg:
    overrideWithFlags pkg [ "-O3" "-march=native" "-fPIC" ];

  withDebugSymbols = pkg:
    overrideWithFlags pkg [ "-DDEBUG" ];

  importDirs = path: with builtins;
    map (n: import (path + ("/" + n)))
      (filter (n: match ".*\\.nix" n != null ||
                  pathExists (path + ("/" + n + "/default.nix")))
        (attrNames (readDir path)));
}
