# https://github.com/jwiegley/nix-config/blob/4d296ad/overlays/emacs/builder.nix
{ stdenv
, emacs
, name
, src
, buildInputs ? []
, patches ? []
, preBuild ? ""
}:

stdenv.mkDerivation {
  inherit name src patches;
  unpackCmd = ''
    test -f "${src}" && mkdir el && cp -p ${src} el/${name}
  '';
  buildInputs = [ emacs ] ++ buildInputs;
  buildPhase = ''
    ${preBuild}
    ${emacs}/bin/emacs -Q -nw -L . --batch -f batch-byte-compile *.el
  '';
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    install *.el* $out/share/emacs/site-lisp
  '';
  meta = {
    description = "Emacs projects from the Internet that just compile `.el` files";
    homepage = http://www.emacswiki.org;
    platforms = stdenv.lib.platforms.all;
  };
}
