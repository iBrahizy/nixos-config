# /etc/nixos/packages/default.nix
{ pkgs, ... }:

let
  fantasqueFont = pkgs.stdenv.mkDerivation {
    pname = "fantasque-nerd-font";
    version = "3.2.1";

    src = pkgs.fetchurl {
      url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FantasqueSansMono.tar.xz";
      sha256 = "079mk8xrri4r1d5k1w5fv1hb0hp3w499csirkd6yriss35sbhv9d";
    };

    installPhase = ''
      mkdir -p $out/share/fonts
      tar -xf $src -C $out/share/fonts
    '';
  };
in
{
  fantasqueFont = fantasqueFont;
}

