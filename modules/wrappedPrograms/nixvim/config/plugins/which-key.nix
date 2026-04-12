{
  flake.nixvimModules.which-key = {
    plugins.which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          separator = "➜";
          group = "";
          rules = false;
        };
        spec = [
          {
            __unkeyed-1 = "<leader>f";
            group = " Find"; # This is your description
          }
          {
            __unkeyed-1 = "<leader>e";
            group = " ESP"; # This is your description
          }
          {
            __unkeyed-1 = "<leader>g";
            group = " Git"; # This is your description
          }

        ];
      };
    };
  };
}
