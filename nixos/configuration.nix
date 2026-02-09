{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/users.nix
      ./packages.nix
      ./modules/sddm.nix
      ./modules/polkit.nix
      ./modules/vm.nix
    ];
  programs.neovim.enable = false;
  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];
  services.udisks2.enable = true;
  hardware.graphics =
    {
      enable = true;
      enable32Bit = true;
    };
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
  networking.networkmanager.wifi.backend = "iwd";

  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
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
  environment = {
    shells = [ pkgs.fish pkgs.bash ];
    variables =
      {
        EDITOR = "nvim";
      };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    powerManagement.enable = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  programs.fish.enable = true;
  fileSystems."/mnt/tera" = {
    device = "/dev/disk/by-uuid/40914f97-8e59-49a9-8559-66cfb6727320 ";
    fsType = "btrfs";
    options = [ "nofail" "defaults" ];
  };
  system.stateVersion = "24.11";

}
