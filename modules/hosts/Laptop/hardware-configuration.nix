{ self, inputs, ... }:
{
  flake.nixosModules.LaptopHardware =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:

    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];
      boot.loader.systemd-boot.enable = false;

      boot.loader.grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      boot.loader.efi.canTouchEfiVariables = true;
      fileSystems."/" = {
        device = "/dev/disk/by-uuid/8fd20c87-c601-4af4-9251-a105dc039613";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/2E8F-38DE";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      fileSystems."/home" = {
        device = "/dev/disk/by-uuid/43445a23-6ab1-4901-969c-c1b004333ae8";
        fsType = "ext4";
      };
      fileSystems."/mnt/tera" = {
        device = "/dev/disk/by-uuid/40914f97-8e59-49a9-8559-66cfb6727320";
        fsType = "btrfs";
        options = [
          "defaults"
          "nofail"
        ];
      };
      swapDevices = [
        {
          device = "/mnt/tera/nixos.swapfile";
          size = 8192;
        }
      ];

      # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
      # (the default) this is the recommended approach. When using systemd-networkd it's
      # still possible to use this option, but it's recommended to use it in conjunction
      # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
      networking.useDHCP = lib.mkDefault true;
      # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
      # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
