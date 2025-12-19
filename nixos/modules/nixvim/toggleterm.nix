{
  plugins.toggleterm = {
    enable = true;
    settings = {
      # Size can be a number or function
      size = 15;

      # Open mapping
      open_mapping = "[[<c-\\>]]";

      # Hide number column in toggleterm buffers
      hide_numbers = true;

      # Shade terminals
      shade_terminals = true;
      shading_factor = 2;

      # Start terminals in insert mode
      start_in_insert = true;

      # Whether to persist size
      persist_size = true;

      # Terminal direction: 'vertical' | 'horizontal' | 'tab' | 'float'
      direction = "float";

      # Close terminal window when process exits
      close_on_exit = true;

      # Floating terminal configuration
      float_opts = {
        border = "curved";
        winblend = 0;
      };
    };
  };
}
