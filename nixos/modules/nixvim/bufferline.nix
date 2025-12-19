{
  plugins = {
    bufferline.enable = true;
    web-devicons.enable = true;
  };
  keymaps = [
      # НАСТУПНИЙ БУФЕР: <Tab>
      {
        mode = "n";
        key = "<Tab>";
        action = ":BufferLineCycleNext<CR>";
        options = {
          silent = true;
          desc = "Next Buffer";
        };
      }

      # ПОПЕРЕДНІЙ БУФЕР: <S-Tab> (Shift + Tab)
      {
        mode = "n";
        # <S-Tab> в Neovim часто записується як <Tab> з модифікатором Shift
        key = "<S-Tab>"; 
        action = ":BufferLineCyclePrev<CR>";
        options = {
          silent = true;
          desc = "Previous Buffer";
        };
      }
    ];
}
