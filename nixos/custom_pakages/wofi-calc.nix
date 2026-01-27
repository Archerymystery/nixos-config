{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "wofi-calc";
  version = "1.1";

  src = pkgs.fetchFromGitHub {
    owner = "Zeioth";
    repo = "wofi-calc";
    rev = "edd316f3f40a6fcb2afadf5b6d9b14cc75a901e0";
    hash = "sha256-y8GoTHm0zPkeXhYS/enNAIrU+RhrUMnQ41MdHWWTPas=";
  };
  runtimeInputs = [ pkgs.libqalculate pkgs.wofi ];
  installPhase = ''
    mkdir -p $out/bin
    cp wofi-calc.sh $out/bin/${pname}
    chmod +x $out/bin/${pname}
  '';
}
