{ self, pkgs, ... }:
{

  flake.homeModules.LaptopHome =
    { pkgs, ... }:
    {
      imports = [
        self.homeModules.vesktop
      ];
      home.packages = [ pkgs.home-manager ];
      home.stateVersion = "25.05";
    };
}
