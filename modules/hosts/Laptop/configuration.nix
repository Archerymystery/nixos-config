{ self, inputs, ... }:
{
  flake.nixosModules.LaptopConfiguration =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.system};
    in

    {
      imports = [
        self.nixosModules.LaptopHardware
        self.nixosModules.desktop
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      networking.hostName = "ArcherLaptop";
      networking.networkmanager.enable = true;
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      services.upower.enable = true;
      time.timeZone = "Europe/Berlin";

      i18n.defaultLocale = "en_US.UTF-8";
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
      nixpkgs.config.allowUnfree = true;
      console.keyMap = "us";

      services.xserver.enable = false;
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        powerManagement.enable = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
      programs.fish = {
        enable = true;
        package = selfpkgs.fish;
      };
      users.users.archer = {
        isNormalUser = true;
        description = "archer";
        extraGroups = [
          "networkmanager"
          "wheel"
          "kvm"
          "adbusers"
          "disk"
          "virtualbox"
        ];
        shell = selfpkgs.fish;

      };
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };

      environment.systemPackages = with pkgs; [
        vim
        firefox
        wget
        git
      ];
      system.stateVersion = "25.11";
    };
}
