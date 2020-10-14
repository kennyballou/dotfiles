{ pkgs, ... }:
# https://stackoverflow.com/questions/42136197/how-to-override-compile-flags-for-a-single-package-in-nixos
let
  overrideWithFlags = pkg: flags:
    pkgs.lib.overrideDerivation pkg (old:
      let
        newflags = pkgs.lib.foldl' (acc: x: "${acc} ${x}") "" flags;
        oldflags = if (pkgs.lib.hasAttr "NIX_CFLAGS_COMPILE" old)
                   then "${old.NIX_CFLAGS_COMPILE}"
                   else "";
      in
        {
          NIX_CFLAGS_COMPILE = "${oldflags} ${newflags}";
        });
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
