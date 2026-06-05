{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, lib, ... }:
    let
      selfpkgs = self.packages."${pkgs.system}";
    in
    {
      imports = [
        self.nixosModules.tablet
        self.nixosModules.obs
      ];

      programs.niri.enable = true;
      programs.niri.package = selfpkgs.niri;

      environment.systemPackages = [
        selfpkgs.terminal

        pkgs.mpv
        pkgs.imv
        pkgs.telegram-desktop
        pkgs.libreoffice-qt
        pkgs.hunspell
        pkgs.hunspellDicts.uk_UA
        pkgs.krita
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        ubuntu-sans
        cm_unicode
        corefonts
        unifont
      ];
      fonts.fontconfig.defaultFonts = {
        serif = [ "Ubuntu Sans" ];
        sansSerif = [ "Ubuntu Sans" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
      xdg.mime.defaultApplications = {
        "application/pdf" = "firefox.desktop";
        "image/png" = "imv.desktop";
        "image/jpeg" = "imv.desktop";
        "image/gif" = "imv.desktop";
        "image/webp" = "imv.desktop";
        "image/svg+xml" = "imv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/mkv" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/avi" = "mpv.desktop";
        "application/vnd.oasis.opendocument.text" = "writer.desktop";
        "application/vnd.oasis.opendocument.spreadsheet" = "calc.desktop";
        "application/vnd.oasis.opendocument.presentation" = "impress.desktop";
        "application/msword" = "writer.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      };
    };
}
