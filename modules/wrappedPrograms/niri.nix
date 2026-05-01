{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        imports = [ self.wrappersModules.niri ];
      };
    };

  flake.wrappersModules.niri =
    {
      pkgs,
      lib,

      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.system};
      noctaliaExe = lib.getExe selfpkgs.myNoctalia;

      c = self.theme;

    in
    {

      settings = {
        spawn-at-startup = [
          noctaliaExe
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input = {
          keyboard = {
            xkb = {
              layout = "us,ua";
              options = "grp:win_space_toggle";
            };
            repeat-rate = 40;
            repeat-delay = 250;
          };

          touchpad = {
            natural-scroll = { };
            tap = { };
          };

          mouse = {
            accel-profile = "flat";
          };
        };
        window-rules = [
          {
            geometry-corner-radius = 5;
            clip-to-geometry = true;
          }
        ];
        layout = {
          gaps = 5;
          focus-ring = {
            active-gradient = _: {
              props = {
                from = c.love;
                to = c.iris;
                angle = 45;
              };
            };
            inactive-color = c.highlight;
          };
        };
        binds = {
          "Mod+Home".spawn-sh = lib.getExe selfpkgs.terminal;
          "Mod+Q".close-window = { };
          "Mod+F".maximize-column = { };
          "Mod+G".fullscreen-window = { };
          "Mod+Shift+F".toggle-window-floating = { };
          "Mod+C".center-column = { };

          "Mod+H".focus-column-left = { };
          "Mod+L".focus-column-right = { };
          "Mod+K".focus-window-up = { };
          "Mod+J".focus-window-down = { };

          "Mod+Left".focus-column-left = { };
          "Mod+Right".focus-column-right = { };
          "Mod+Up".focus-window-up = { };
          "Mod+Down".focus-window-down = { };

          "Mod+Shift+H".move-column-left = { };
          "Mod+Shift+L".move-column-right = { };
          "Mod+Shift+K".move-window-up = { };
          "Mod+Shift+J".move-window-down = { };

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+0".focus-workspace = 10;

          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;
          "Mod+Shift+5".move-column-to-workspace = 5;
          "Mod+Shift+6".move-column-to-workspace = 6;
          "Mod+Shift+7".move-column-to-workspace = 7;
          "Mod+Shift+8".move-column-to-workspace = 8;
          "Mod+Shift+9".move-column-to-workspace = 9;
          "Mod+Shift+0".move-column-to-workspace = 10;

          "Mod+S".spawn-sh = "${noctaliaExe} ipc call launcher toggle";

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

          "Mod+Ctrl+H".set-column-width = "-5%";
          "Mod+Ctrl+L".set-column-width = "+5%";
          "Mod+Ctrl+J".set-window-height = "-5%";
          "Mod+Ctrl+K".set-window-height = "+5%";

          "Mod+WheelScrollDown".focus-column-left = { };
          "Mod+WheelScrollUp".focus-column-right = { };
          "Mod+Ctrl+WheelScrollDown".focus-workspace-down = { };
          "Mod+Ctrl+WheelScrollUp".focus-workspace-up = { };
          "Print".screenshot = { };
          "Mod+Print".screenshot-screen = { };
          "Alt+Print".screenshot-window = { };

        };
      };
    };
}
