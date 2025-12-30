{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/users.nix
      ./packages.nix
      ./modules/sddm.nix
    ];
  programs.neovim.enable = false;
  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];
  services.udisks2.enable = true;
  programs.adb.enable = true;
  hardware.graphics.enable = true;
  networking.hostName = "nixos";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  programs.nix-ld.enable = true;


  networking.networkmanager.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  networking.wireless.iwd.enable = true;

  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
    LC_ALL = "uk_UA.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  console.keyMap = "us";

  nixpkgs.config.allowUnfree = true;


  programs.hyprland = {
    enable = true;

  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    forceFullCompositionPipeline = true;
  };
  programs.fish.enable = true;

  system.stateVersion = "25.05";

}
