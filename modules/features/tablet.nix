{ self, inputs, ... }:
{
  flake.nixosModules.tablet =
    { pkgs, ... }:

    {
      hardware.opentabletdriver.enable = true;
      boot.blacklistedKernelModules = [
        "hid-uclogic"
        "uclogic"
      ];

      environment.systemPackages = [
        pkgs.opentabletdriver
      ];
    };
}
