{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        #todo rewrite into nix
        settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
      };
    };
}
