{ self, inputs, ... }:
{
  flake.nixosConfigurations.Laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.LaptopConfiguration
    ];
  };
}
