{ config, lib, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
    package = pkgs.libsForQt5.sddm; # Це Qt5 версія
    extraPackages = with pkgs; [
      libsForQt5.qt5.qtsvg
      libsForQt5.qt5.qtmultimedia
      libsForQt5.qt5.qtvirtualkeyboard
      libsForQt5.qt5.qtgraphicaleffects
    ];
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };
}

