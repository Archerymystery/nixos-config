{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      exec-once = [
        #       "hyprctl setcursor Dracula-cursors 24"
        "hyprpaper"
        "waybar"
        "hyprctl setcursor Dracula-cursors 24"
      ];
      monitor = [
        "HDMI-A-1,3440x1440,0x0,1"
        "eDP-1,1920x1080,3440x0,1"

      ];
      env = [
        "HYPRCURSOR_THEME,Dracula-cursors"
        "HYPRCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];
      input = {

        kb_layout = "us,ua";

        kb_options = grp:win_space_toggle;


        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
        };

        sensitivity = 0;
      };
      cursor = {
        no_hardware_cursors = 1;
        #	allow_dumb_copy=1;

      };
      general = {
        gaps_in = 5;
        gaps_out = 8;
        border_size = 1;
        "col.active_border" = "rgb(e25656) rgb(e5d487) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };
      decoration = {
        rounding = 6;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0, 0, 0, 0";
        animation = [
          "windows, 1, 3, myBezier, slide"
          "windowsOut, 1, 3, myBezier, popin 20%"
          "fade, 1, 3, myBezier"
          "workspaces, 1, 2, myBezier, slidefade"
        ];

      };
      bind = [
        "$mainMod, S, exec, wofi --show drun"
        "$mainMod, C, killactive, "
        "$mainMod, M, exit, "
        "$mainMod, V, togglefloating, "
        "$mainMod, P, pseudo, "
        "$mainMod, J, togglesplit,"
        "$mainMod CTRL,C, exec, wofi-calc "

        "$mainMod, L, togglespecialworkspace, magic"
        "$mainMod SHIFT, L, movetoworkspace, special:magic"

        ",107, exec, grimblast copysave screen"
        "CTRL,107, exec, grimblast copysave area"

        "$mainMod,left,movefocus,l"
        "$mainMod,right,movefocus,r"
        "$mainMod,up,movefocus,u"
        "$mainMod,down,movefocus,d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod,mouse_down,workspace,e+1"
        "$mainMod,mouse_up,workspace,e-1"
      ];
      bindm = [
        "$mainMod ,mouse:272,movewindow"
        "$mainMod ,mouse:273,resizewindow"
      ];


      windowrulev2 = [
        "float,title:(Picture-in-Picture)"
        "size 600 340,title:(Picture-in-Picture)"
        "move 100%-600 35,title:(Picture-in-Picture)"
        "float,title:(Library)"
        "float,title:(Simulations)"
        #	"size 800 800, title:(Simulations)"
        "pin,title:(Picture-in-Picture)"
        #Telegram
        "fullscreen,title:(Media viewer)"
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/archer/Documents/Wallpaper/1.png";
      wallpaper = [
        "eDP-1,/home/archer/Documents/Wallpaper/1.png"
        "HDMI-A-1,/home/archer/Documents/Wallpaper/1.png"
      ];
    };
  };
}
