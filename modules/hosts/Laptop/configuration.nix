{ self, inputs, ... }: {
  flake.nixosModules.LaptopConfiguration = { pkgs, config, lib, ... }: {
    # import any other modules from here
    imports = [
      self.nixosModules.LaptopHardware
    ];

    {
      imports = [
        self.nixosModules.LaptopHardware
        self.nixosModules.desktop
      ];

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

    console.keyMap = "us";
    system.stateVersion = "25.11";
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      powerManagement.enable = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    environment.systemPackages = with pkgs; [
      vim
      firefox
      wget
      fish
    ];
  };
}
