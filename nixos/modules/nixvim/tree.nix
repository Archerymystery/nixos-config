{
  plugins.neo-tree = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<C-e>"; # C-e означає Ctrl+e
      # Команда відкриває файлову систему і показує її зліва
      action = ":Neotree filesystem reveal left<CR>";
      options = {
        silent = true;
        desc = "Toggle Neo-tree (Filesystem)";
      };
    }
  ];
}
