{ config, lib, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
    theme = "sddm-astronaut-theme";
  };
}
