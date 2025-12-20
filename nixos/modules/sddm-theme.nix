{ pkgs }:

#let
#  imgLink = "https://YOURIMAGELINK/image.png";
#
#  image = pkgs.fetchurl {
#    url = imgLink;
#    sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
#  };
#in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Zhaith-Izaliel";
    repo = "sddm-sugar-candy-nix";
    rev = "00e0aff3ebf64cebfc16bb6df7e69d8923bbd4ef";
    sha256 = "0i63p07xsazwcdscl2r8y1sdglfzq64qrcgncv5sv1hq7mi177qs";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
