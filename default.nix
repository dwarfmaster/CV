{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
  packages = [ ];
  myTexLive = with pkgs; texlive.combine {
    inherit (texlive) scheme-full comfortaa;
  };
in pkgs.stdenv.mkDerivation {
  name = "cv";
  buildInputs = with pkgs; [ less man myTexLive gnumake ] ++ packages;
}

