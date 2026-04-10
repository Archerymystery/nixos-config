{
  lib,
  inputs,
  self,
  ...
}:
{
  perSystem =
    {
      pkgs,
      self',
      ...
    }:
    {
      packages.terminal =
        (inputs.wrappers.wrapperModules.kitty.apply {
          inherit pkgs;
          imports = [ self.wrappersModules.kitty ];
          shell = lib.getExe self'.packages.environment;
        }).wrapper;
      packages.environment = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = self'.packages.fish;
        runtimeInputs = [
        ];
        # env = {
        #   EDITOR = lib.getExe self'.packages.neovimDynamic;
        # };
      };
    };
}
