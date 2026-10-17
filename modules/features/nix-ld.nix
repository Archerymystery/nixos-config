{ self, ... }:
{
  flake.nixosModules.nix-ld =
    { pkgs, config, ... }:
    {
      programs.nix-ld.enable = true;
      programs.nix-ld.libraries = with pkgs; [
        mesa
        libgbm
        libinput
        wayland
        libX11
        libXcursor
        libXrandr
        libXi
        libXext
        libxkbcommon
        stdenv.cc.cc.lib
        glib
        fontconfig
        freetype
      ];
    };
}
