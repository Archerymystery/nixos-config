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
      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.system};
    in
    {
      packages.terminal =
        (inputs.wrappers.wrapperModules.kitty.apply {
          inherit pkgs;
          imports = [ self.wrappersModules.kitty ];
          shell = lib.getExe selfpkgs.environment;
        }).wrapper;
      packages.environment = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = selfpkgs.fish;
        runtimeInputs = [
          selfpkgs.git
          selfpkgs.nixvim
        ];
        env = {
          EDITOR = lib.getExe selfpkgs.nixvim;
        };
      };
    };
}
