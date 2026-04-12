{
  flake.nixvimModules.toggleterm = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        size = 15;
        open_mapping = "[[<c-\\>]]";
        hide_numbers = true;
        shade_terminals = true;
        shading_factor = 2;
        start_in_insert = true;
        persist_size = true;
        direction = "float";
        close_on_exit = true;
        float_opts = {
          border = "curved";
          winblend = 0;
        };
      };
    };
  };
}
