{ pkgs ? import <nixpkgs> { } }:

pkgs.writeShellApplication {
  name = "wofi-screenshot";
  runtimeInputs = [ pkgs.tesseract pkgs.grimblast pkgs.wofi pkgs.wl-clipboard ];
  text = builtins.readFile ../../scripts/wofi-screenshot.sh;

}
