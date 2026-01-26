{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "wofi-wifi-menu";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "fourstepper";
    repo = "wofi-wifi-menu";
    rev = "cb8da9cfd7e10d48ec831410c55104a4857251d3";
    hash = "sha256-jp6PKqRrUy9ACwbvLNs3Y7x1P5Ok6rwu8QETsSBGqJE=";
  };
  buildInputs = [ pkgs.iw pkgs.wofi ];
  installPhase = ''
    mkdir -p $out/bin
    cp wofi-wifi-menu.sh $out/bin/${pname}
    chmod +x $out/bin/${pname}

  '';
}
