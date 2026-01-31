{
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      anchor = "top-right";
      background-color = "#1a1b26ee";
      border-color = "#f28f61";
      border-size = 2;
      border-radius = 8;
      text-color = "#d8dee9";
      default-timeout = 5000;
      font = "JetBrainsMono Nerd Font 11";
      height = 150;
      width = 350;
      margin = "20";
      padding = "15";

      icons = true;
      max-icon-size = 64;
      layer = "overlay";
    };
    extraConfig = ''
      [urgency=high]
      border-color=#e06c75
      default-timeout=0
    '';
  };
}
