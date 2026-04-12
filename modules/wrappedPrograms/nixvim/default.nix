{ self, inputs, ... }:
{
  perSystem =
    { system, pkgs, ... }:
    let
      nixvim' = inputs.nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = {
          imports = builtins.attrValues self.nixvimModules;
        };
      };
    in
    {
      packages.nixvim = nvim;
    };
}
