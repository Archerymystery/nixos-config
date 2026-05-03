{
  flake.neovimModules.bufferline =
    { ... }:
    {
      vim = {
        tabline.nvimBufferline.enable = true;
      };
    };
}
