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
      ];

      programs.niri.enable = true;
      programs.niri.package = selfpkgs.niri;

      environment.systemPackages = [
        selfpkgs.terminal
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
