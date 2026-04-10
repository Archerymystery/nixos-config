{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.kitty =
        (inputs.wrappers.wrapperModules.kitty.apply {
          inherit pkgs;
          imports = [ self.wrappersModules.kitty ];
        }).wrapper;
    };

  flake.wrappersModules.kitty =
    {
      config,
      lib,

      ...
    }:
    let
      c = self.theme;
    in
    {
      options.shell = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      config = {
        args = lib.mkAfter (lib.optionals (config.shell != "") [ config.shell ]);
        settings = {

          font_size = 13;
          font_family = "JetBrainsMono Nerd Font";
          allow_remote_control = "yes";
          shell_integration = "enabled";
          cursor_trail = 3;
          tab_bar_style = "slant";
          map = [
            "alt+1 goto_tab 1"
            "alt+2 goto_tab 2"
            "alt+3 goto_tab 3"
            "alt+4 goto_tab 4"
            "alt+5 goto_tab 5"
            "alt+6 goto_tab 6"
            "alt+7 goto_tab 7"
            "alt+8 goto_tab 8"
            "alt+9 goto_tab 9"
            "ctrl+shift+w close_tab"
            "ctrl+t new_tab_with_cwd"
            "ctrl+shift+t new_tab"
          ];

          background = c.base;
          foreground = c.text;
          cursor = c.text;
          cursor_text_color = c.base;
          selection_background = c.highlight;
          selection_foreground = c.text;
          active_border_color = c.rose;
          inactive_border_color = c.foam;
          active_tab_background = c.rose;
          active_tab_foreground = c.base;
          inactive_tab_background = c.overlay;
          inactive_tab_foreground = c.subtle;
          color0 = c.overlay;
          color1 = c.love;
          color2 = c.pine;
          color3 = c.gold;
          color4 = c.foam;
          color5 = c.iris;
          color6 = c.rose;
          color7 = c.text;
          color8 = c.muted;
          color9 = c.love;
          color10 = c.pine;
          color11 = c.gold;
          color12 = c.foam;
          color13 = c.iris;
          color14 = c.rose;
          color15 = c.text;

        };
      };
    };
}
