{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs;
    [
    ];

  buildInputs = with pkgs;
    [
      libusb1
      libGL
      libGL.dev
      libglvnd
      libglvnd.dev
      mesa
    ];

  shellHook = ''
    echo "Opening Charcoal/CharcoalRoot/CharcoalRoot.pro with QtCreator"
    qtcreator Charcoal/CharcoalRoot/CharcoalRoot.pro &
  '';
}
