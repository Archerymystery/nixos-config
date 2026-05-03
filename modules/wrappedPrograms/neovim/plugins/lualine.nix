{
  flake.neovimModules.lualine =
    { ... }:
    {
      vim = {
        statusline.lualine.enable = true;
      };
    };
}
