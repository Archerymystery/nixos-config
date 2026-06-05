{ self, inputs, ... }:
{
  flake.nixosModules.LaptopConfiguration =
    {
      pkgs,
      config,
      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.system};
    in

    {
      imports = [
        self.nixosModules.LaptopHardware
        self.nixosModules.desktop
        self.nixosModules.general
        self.nixosModules.base
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      networking = {
        hostName = "ArcherLaptop";
        networkmanager.enable = true;
      };
      time.timeZone = "Europe/Berlin";

      i18n.defaultLocale = "en_US.UTF-8";
      services = {
        upower.enable = true;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };
        xserver.xkb = {
          layout = "us";
          variant = "";
        };
        xserver = {
          enable = false;
          videoDrivers = [ "nvidia" ];
        };
        displayManager.sddm = {
          enable = true;
          wayland.enable = true;
        };

      };
      nixpkgs.config.allowUnfree = true;
      console.keyMap = "us";

      hardware = {
        bluetooth = {
          enable = true;
          powerOnBoot = true;
        };
        nvidia = {
          modesetting.enable = true;
          open = true;
          powerManagement.enable = false;
          nvidiaSettings = true;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
      };
      programs.fish = {
        enable = true;
        package = selfpkgs.fish;
      };
      environment.systemPackages = with pkgs; [
        vim
        firefox
        wget
      ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${config.preferences.user.name} = self.homeModules.LaptopHome;
      };
      system.stateVersion = "25.11";
    };
}
