{
  flake.neovimModules.nvim-cmp =
    { ... }:
    {
      vim = {
        autocomplete.nvim-cmp = {
          enable = true;
          sources = {
            nvim_lsp = "[LSP]";
            buffer = "[Buffer]";
            path = "[Path]";
          };

          mappings = {
            complete = "<C-Space>";
            confirm = "<CR>";
            next = "<Tab>";
            previous = "<S-Tab>";
            close = "<C-e>";
            scrollDocsUp = "<C-d>";
            scrollDocsDown = "<C-f>";
          };
        };
        snippets.luasnip.enable = true;
      };
    };
}
