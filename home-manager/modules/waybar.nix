{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        modules-left = [
          "hyprland/workspaces"
          "bluetooth"
          "network"
        ];
        modules-center = [
          "custom/clock"
        ];
        modules-right = [
          "pulseaudio"
          "pulseaudio#microphone"
          "hyprland/language"
          "group/hardware"
          "custom/powermenu"
        ];
        battery = {
          bat = "BAT1";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
          max-length = 25;
        };
        clock = {
          interval = 60;
          format = "{:%H:%M}";
          max-length = 25;
        };

        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            children-class = "not-power";
            transition-left-to-right = false;
          };

          modules = [
            "battery"
            "cpu"
            "memory"
            "disk"
            "backlight"
          ];
        };

        disk = {
          interval = 30;
          format = "{percentage_used}% 󱛟";
          path = "/";
        };

        cpu = {
          interval = 10;
          format = "{}%  ";
          max-length = 10;
        };

        memory = {
          interval = 30;
          format = "{}%  ";
          max-length = 10;
        };
        pulseaudio = {
          format = "{icon}  {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "󰖁";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
            ];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "󰂲";
          format-connected = " {device_alias}";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "blueberry";
        };

        network = {
          format-disconnected = "Disconnected";
          format-wifi = "  {essid}";
          on-click = "wofi-wifi-menu";
        };
        backlight = {
          device = "amdgpu_bl2";
          format = "{percent}% {icon}";
          format-icons = [ " " " " ];
        };
        "hyprland/workspaces" = {
          format = "{icon}";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "wpctl set-mute @DEFAULT_SOURCE@ toggle";
          on-scroll-up = "wpctl set-volume @DEFAULT_SOURCE@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_SOURCE@ 5%-";
        };
        "custom/clock" = {
          interval = 60;
          exec = "date  +'  %A, %B %d [%H:%M]'";
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-uk = "UA";
        };

        "custom/powermenu" = {
          format = "󰐥";
          on-click = "selected=$(echo -e '⏻ Shutdown\n⭮ Reboot\n󰌾 Lock\n⏾ Suspend\n⇠ Logout' | wofi --width 250 --height 240 --dmenu --cache-file /dev/null --location 3 | awk '{print tolower($2)}') && case $selected in logout) hyprctl dispatch exit;; suspend) hyprlock & systemctl suspend;; reboot) systemctl reboot;; shutdown) systemctl poweroff;; lock) hyprlock;; esac";
        };

      };
    };
    style =
      ''
         * {
            border: none;
            font-family: Font Awesome, Roboto, Arial, sans-serif;
            font-size: 14px;
            color: #ffffff;
            border-radius: 13px;
        }


        window#waybar {
          background:none;
        }
        .modules-right {
        	background-color:rgb(8, 8, 8);
            margin: 2px 10px 0 0;
            border-radius: 7px;
        }
        .modules-center {
        	background-color:  rgb(8, 8, 8);;
            border-radius: 7px;
            margin: 2px 0 0 0;
        }
        .modules-left {
            margin: 2px 0 0 5px;
        	background-color:  rgb(8, 8, 8);;
            border-radius: 7px;
        }

        #workspaces button.active {
            color: #f5a97f;
          }
  
          #workspaces button {
            color: #9c9c9c;
            margin-right: 5px;
            padding-right: 0px;
            padding-left: 0px;
          }
  
          #workspaces button.focused {
            color: #a6adc8;
            background: #eba0ac;
            border-radius: 7px;
          }
  
          #workspaces button.urgent {
            color: #11111b;
            background: #a6e3a1;
            border-radius: 7px;
          }
  
          #workspaces button:hover {
            background: none;
            text-shadow: none;
            box-shadow: none;
          }
          #workspaces button:hover label {
            background: none;
            color: #EA6A43;
            border-radius: 7px;
            transition: color 0.3s ease; 

          }
  
        #custom-clock,
        #battery,
        #bluetooth,
        #network,
        #workspaces,
        #pulseaudio,
        #language,
        #custom-powermenu,
        #disk,
        #cpu,
        #memory,
        #group-hardware {
            padding: 2px 7px 2px 7px;
            color:rgb(255, 255, 255);
        }


        #battery {
            color: #F2C185;
        }

        #battery.critical {
            color: #8C342B;
        }

        #battery.low {
            color: #F2845C;
        }

        #battery.good {
            color:rgb(255, 217, 0); 
        }

        #battery.full {
            color:rgb(14, 169, 0); 
        }


        #custom-powermenu {
            color: #D31E32;
            font-size: 20px;
        }

        #bluetooth{
            color:rgb(18, 74, 152);
        }

        #network{
           color:rgb(72, 25, 137);
        }
        #custom-clock{
            color: #ffaf8a;
        }
        #pulseaudio{
            color: #E2633A;
        }
        #pulseaudio{
            color: #E2633A;
        }
        #pulseaudio#microphone.muted{
            color: #8C342B;
        }
      '';

  };

}
