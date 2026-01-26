{ config, lib, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true; # Enable SDDM.
    wayland.enable = true;
    theme = "sddm-astronaut-theme";

    extraPackages = with pkgs; [
      # Ці пакети необхідні для роботи теми на Qt6 (Unstable)
      kdePackages.qt5compat
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      # Якщо ви хочете використовувати кастомні шрифти в темі:
      # (наприклад, montserrat)
    ];
  };
  environment.etc."/usr/share/sddm/themes/sddm-astronaut-theme/theme.conf.user".text = ''
    [General]
    Background="/home/archer/nixos/media/wallpaper.png"
    FormPosition=left
    FullBlur=true
    PartialBlur=true
  '';

}

