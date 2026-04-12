{
  flake.nixvimModules.dashboard = {
    plugins.dashboard = {
      enable = true;
      settings = {
        config = {
          header = [
            ""
            ""
            " █████╗ ██████╗  ██████╗██╗  ██╗███████╗██████╗ "
            "██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗"
            "███████║██████╔╝██║     ███████║█████╗  ██████╔╝"
            "██╔══██║██╔══██╗██║     ██╔══██║██╔══╝  ██╔══██╗"
            "██║  ██║██║  ██║╚██████╗██║  ██║███████╗██║  ██║"
            "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
            ""
            ""
          ];
          mru = {
            limit = 20;
          };
          project = {
            enable = false;
          };
          shortcut = [
            {
              action = "Telescope find_files";
              desc = "󰈞 Files";
              group = "Label";
              key = "f";
            }
            {
              action = "Neotree";
              desc = "󰙅 Open tree";
              group = "DiagnosticHint";
              key = "e";
            }
            {
              action = "Telescope git_branches";
              desc = " Git Breaches";
              group = "Number";
              key = "g";
            }
          ];
        };
      };
    };
  };
}
