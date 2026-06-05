{
  flake.neovimModules.gitsigns =
    { ... }:
    {
      vim = {
        git.gitsigns.enable = true;
      };
    };
}
