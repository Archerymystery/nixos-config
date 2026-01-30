{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/starship.nix
    ./modules/fish.nix
    ./modules/fastfetch.nix
    ./modules/waybar.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/wofi.nix
    ./modules/hyprlock.nix
    ./modules/mako.nix
    ./modules/battery-notification.nix
  ];
  home = {
    username = "archer";
    homeDirectory = "/home/archer";
    stateVersion = "25.05";
  };
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  xdg = {

    enable = true;

    userDirs = {
      enable = true;

      extraConfig = {
        XDG_AUDIO_DIR = "$HOME/Audio";
        XDG_PROJETS_DIR = "$HOME/Projets";
        XDG_SCREENSHOTS_DIR = "$HOME/Screenshots";
      };
    };
  };
  services.cliphist.enable = true;

  programs.home-manager.enable = true;
}
