{ pkgs
, ...
}:
{
  systemd.user.services.battery-monitor = {
    Unit = {
      Description = "Battery level monitor";
    };
    Service = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "battery-check" ''
                # Get battery percentage (adjust 'BAT0' if your system uses a different ID)
                BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
                BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

                # Check if battery is low and NOT charging
                if [ "$BATTERY_LEVEL" -le 10 ] && [ "$BATTERY_STATUS" != "Charging" ]; then
                   GTK_THEME=Dracula zenity --warning --title="Low Battery" --text="Your battery is at $LEVEL%.\nConnect your charger immediately!" --width=300        
        	fi
      '';
    };
  };

  # The timer to run the service every minute
  systemd.user.timers.battery-monitor = {
    Unit = {
      Description = "Run battery monitor every minute";
    };
    Timer = {
      OnBootSec = "1m";
      OnUnitActiveSec = "1m";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
