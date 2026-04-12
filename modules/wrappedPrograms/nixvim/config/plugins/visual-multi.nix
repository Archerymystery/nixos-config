{
  flake.nixvimModules.visual-multi = {
    plugins.visual-multi = {
      enable = true;
      settings = {
        default_mappings = 1;
        maps = {
          "Add Cursor Down" = "<M-Down>";
          "Add Cursor Up" = "<M-Up>";
          "Mouse Cursor" = "<M-LeftMouse>";
          "Mouse Word" = "<M-RightMouse>";
          "Select All" = "<C-M-n>";
        };
        mouse_mappings = 1;
        show_warnings = 1;
        silent_exit = 0;
      };
    };
  };
}
