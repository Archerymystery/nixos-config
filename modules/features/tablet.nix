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
        pkgs.xournalpp
      ];
      xdg.mime.defaultApplications = {
        "application/x-xopp" = "com.github.xournalpp.xournalpp.desktop";
      };

    };
}
