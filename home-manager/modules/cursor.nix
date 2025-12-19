{ pkgs, ... }: {
  # home.pointerCursor = {
  #   gtk.enable = true; # Включити підтримку для GTK
  #   x11.enable = true; # Включити для X11
  #   package = pkgs.dracula-theme;
  #   name = "Dracula-cursors";
  #   size = 24; # Розмір курсора (24, 32, 48)
  #};
  # gtk.enable = true; 
  # gtk.cursorTheme = {
  #  package = pkgs.dracula-theme;
  # name = "Dracula-cursors";
  # size = 24;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula-cursors";
    };
  };
}
