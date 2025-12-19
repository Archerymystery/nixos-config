{
  programs.fastfetch.enable = true;
  programs.fastfetch.settings = {
    logo = {
      source = "nixos";
      padding = {
        right = 1;
      };
    };
    display = {
      size = {
        binaryPrefix = "si";
      };
      color = "blue";
      separator = "  ";
    };
    modules = [
      {
        type = "custom";
        format = "┌───────── Hardware Information ─────────┐";
        color = {
          fg = 2;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "host";
        format = "{2} {3}";
        key = " 󱄅 ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "cpu";
        format = "{1}";
        key = "  ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "gpu";
        format = "{1} {2}";
        key = "  ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "memory";
        format = "{1} / {2} ({3})";
        key = "  ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "display";
        format = "{1}x{2}";
        key = " 󰹑 ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "custom";
        format = "├───────── Software Information ─────────┤";
        color = {
          fg = 2;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "os";
        format = "{3}";
        key = " 󱄅 ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "wm";
        format = "{1}";
        key = "  ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "shell";
        format = "{3} {4}";
        key = "  ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "terminal";
        format = "{1}";
        key = "  ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "packages";
        format = "{1}";
        key = " 󰏖 ";
        color = {
          fg = 5;
          bg = 0;
          bold = true;
        };
      }

      {
        type = "custom";
        format = "└────────────────────────────────────────┘";
        color = {
          fg = 2;
          bg = 0;
          bold = true;
        };
      }
      {
        type = "custom";
        format = "          {#90}󰄯  {#31}󰄯  {#32}󰄯  {#33}󰄯  {#34}󰄯  {#35}󰄯  {#36}󰄯  {#37}󰄯 ";
      }

    ];
  };
}
