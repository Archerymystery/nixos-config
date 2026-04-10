{
  inputs,
  lib,
  self,
  ...
}:
{
  perSystem =
    {
      pkgs,
      # self,
      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.system};

      fishConf = pkgs.writeText "fishy-fishy" ''
        ${lib.getExe selfpkgs.starship} init fish | source      
      '';
    in
    {
      packages.fish = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.fish;
        flags = {
          "-C" = "source ${fishConf}";
        };
        runtimeInputs = [
          selfpkgs.starship
        ];
      };
    };
}
