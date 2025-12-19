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
    #    ./modules/cursor.nix
    #    ./modules/nixvim.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "archer"; # No 'home.' prefix needed here
    homeDirectory = "/home/archer";
    stateVersion = "25.05"; # Please read the comment before changing.

    # ... other home.* settings
  };
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia"; # For NVIDIA hardware
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  xdg = {
    # Enable management of XDG base directories
    enable = true;
    # Enable management of user directories
    userDirs = {
      # Setup default user directories (Desktop, Documents, Downloads, Music, Pictures, Public, Templates and Videos)
      enable = true;
      # Setup extra user directories
      extraConfig = {
        XDG_AUDIO_DIR = "$HOME/Audio";
        XDG_PROJETS_DIR = "$HOME/Projets";
        XDG_SCREENSHOTS_DIR = "$HOME/Screenshots";
      };
    };
  };
  # User packages (if not installed system-wide)
  home.packages = with pkgs; [
    glxinfo # Debugging tool for OpenGL
    inputs.nixvim.packages.${pkgs.system}.default
  ];
  programs.home-manager.enable = true;
}
