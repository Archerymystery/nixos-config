{ self, inputs, ... }:
{
  perSystem =
    { system, pkgs, ... }:
    let
      my-neovim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = builtins.attrValues self.neovimModules;
        }).neovim;
    in
    {
      packages.neovim = my-neovim;
    };
}
