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
    };
}
