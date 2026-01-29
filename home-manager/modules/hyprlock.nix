{
  programs.jq.enable = true;
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
      };
      animations = {
        enabled = true;
        fade_in = {
          bezier = "linear, 1, 1, 0, 0";
        };
        fade_out = {
          duration = 300;
          bezier = "linear, 1, 1, 0, 0";
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
          position = "0, 200";
          halign = "center";
          valign = "bottom";
        }
      ];
      #100,114,125,0.4 
      shape = [
        {
          monitor = "";
          color = "rgba(32, 55, 89,0.4)";
          size = "500, 140";
          rounding = "10";
          position = "0, 40";
          halign = "center";
          valign = "bottom";
          zindex = 0;

        }
        {
          monitor = "";
          color = "rgb(19, 23, 28)";
          size = "50, 50";
          rounding = "25";
          position = "10, 10";
          halign = "left";
          valign = "bottom";
          zindex = 1;

        }
        {
          monitor = "";
          color = "rgb(254, 206, 134)";
          size = "54, 54";
          rounding = "28";
          position = "8, 8";
          halign = "left";
          valign = "bottom";
          zindex = 0;

        }

      ];
      label = [
        {
          monitor = "";
          text = "$TIME";
          font_family = "JetBrains Mono Nerd Font";
          font_size = 110;
          color = "rgb(255, 255, 255)";
          position = "0, 140";
          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:60000] echo "$(date +"%A %d %B")"'';
          color = "rgb(255, 255, 255)";
          font_size = 24;
          font_family = "JetBrains Mono Nerd Font";
          position = "0, 60";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''Hi, <span color='##ff0000'>$USER</span>'';
          color = "rgb(255, 255, 255)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | sed 's/English (US)/EN/;s/Ukrainian/UA/')"'';
          color = "rgb(255, 255, 255)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font";
          position = "17, 17";
          halign = "left";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] sh ${../../scripts/hyprlock-mediaplayer.sh} --title'';
          color = "rgb(255, 255, 255)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font";
          position = "40, 140";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] sh ${../../scripts/hyprlock-mediaplayer.sh} --artist'';
          color = "rgb(255, 255, 255)";
          font_size = 10;
          font_family = "JetBrains Mono Nerd Font";
          position = "40, 120";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:100] sh ${../../scripts/hyprlock-mediaplayer.sh} --progress'';
          color = "rgb(255, 255, 255)";
          font_size = 12;
          font_family = "JetBrains Mono Nerd Font";
          position = "60, 100";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:100] sh ${../../scripts/hyprlock-mediaplayer.sh} --status'';
          onclick = "sh ${../../scripts/hyprlock-mediaplayer.sh} --switch";
          color = "rgb(255, 255, 255)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font";
          position = "40, 68";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] sh ${../../scripts/hyprlock-mediaplayer.sh} --icon '';
          onclick = "sh ${../../scripts/hyprlock-mediaplayer.sh} --next";
          color = "rgb(255, 255, 255)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font";
          position = "80, 68";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] sh ${../../scripts/hyprlock-mediaplayer.sh} --icon  '';
          onclick = "sh ${../../scripts/hyprlock-mediaplayer.sh} --previous";
          color = "rgb(255, 255, 255)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font";
          position = "-3, 68";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] sh ${../../scripts/hyprlock-mediaplayer.sh} --none'';
          color = "rgb(255, 255, 255)";
          font_size = 24;
          font_family = "JetBrains Mono Nerd Font";
          position = "0, 90";
          halign = "center";
          valign = "bottom";
          zindex = 2;
        }




      ];
      image = [
        {
          #─
          path = "${../../media/clear_img.png}";
          size = 100;
          rounding = 5;
          border_size = 0;
          rotate = 0;
          reload_time = 2;
          reload_cmd = ''sh ${../../scripts/hyprlock-mediaplayer.sh} --cover'';
          position = "-180,60";
          halign = "center";
          valign = "bottom";
          zindex = 1;
        }
      ];

    };
  };
}
