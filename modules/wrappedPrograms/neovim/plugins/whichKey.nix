{
  flake.neovimModules.whichKey =
    { ... }:
    {
      vim = {
        binds.whichKey.enable = true;
      };
    };
}
