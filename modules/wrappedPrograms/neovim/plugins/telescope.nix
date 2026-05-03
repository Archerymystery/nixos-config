{
  flake.neovimModules.telescope =
    { ... }:
    {
      vim = {
        telescope.enable = true;
      };
    };
}
