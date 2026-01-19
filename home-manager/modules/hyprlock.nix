{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };
      background = [
        {
          path = "$HOME/nixos/media/wallpaper.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          size = "250, 50";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.64;
          dots_center = true;
          outer_color = "rgb(254, 206, 134)";
          inner_color = "rgb(19, 23, 28)";
          font_color = "rgb(255, 255, 255)";
          fade_on_empty = true;
          check_color = "rgb(57, 70, 104)";
          fail_color = "rgb(204, 34, 34)";
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          hide_input = false;
          position = "0, 60";
          halign = "center";
          valign = "bottom";
        }
      ];
      label = [
        {
          monitor = "";
          text = "$TIME";
          font_family = "JetBrains Mono Nerd Font 10";
          font_size = 120;
          color = "rgba(57, 70, 104)";
          position = "0, -300";
          valign = "top";
          halign = "center";
        }
        {
          monitor = "";
          text = "$LAYOUT";
          color = "rgb(254, 206, 134)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, 10";
          halign = "center";
          valign = "bottom";
        }


      ];

    };
  };
}
