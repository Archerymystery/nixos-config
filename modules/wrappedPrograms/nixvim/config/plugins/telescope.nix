{
  flake.nixvimModules.telescope = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
        };
        layout_config = {
          prompt_position = "top";
        };

      };
    };
  };
}
