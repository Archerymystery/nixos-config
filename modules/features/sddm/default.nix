{ self, ... }:
{
  flake.nixosModules.sddm =
    { pkgs, ... }:
    let
      sddm-theme = pkgs.stdenvNoCC.mkDerivation {
        pname = "sddm-frieren-theme";
        version = "1.0";
        src = ./theme;
        dontBuild = true;
        installPhase = ''
          mkdir -p $out/share/sddm/themes/frieren
          cp -r * $out/share/sddm/themes/frieren/
          cp ${../../../media/wallpaper.png} $out/share/sddm/themes/frieren/wallpaper.png
        '';
      };
    in
    {
      environment.systemPackages = [ sddm-theme ];

      services.displayManager.sddm = {
        enable = true;
        wayland = {
          compositor = "kwin";
          enable = true;
        };
        package = pkgs.kdePackages.sddm;
        theme = "frieren";
        extraPackages = [
          sddm-theme
        ]
        ++ (with pkgs.kdePackages; [
          qtsvg
          qtmultimedia
        ]);
        settings = {
          Theme = {
            CursorTheme = "Adwaita";
            CursorSize = 24;
          };
        };
      };
    };
}
