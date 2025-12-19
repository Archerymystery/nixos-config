{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      background_opacity = "0.5";
      background_blur = 5;
      confirm_os_window_close = 0;
    };
  };

}
