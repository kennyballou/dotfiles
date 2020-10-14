{ config, ... }:
{
  overlays =
    let
      paths = [
        ./overlays
      ];
    in with builtins;
      concatMap (path:
        (map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
            (attrNames (readDir path))))) paths;
}
