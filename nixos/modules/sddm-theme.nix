{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "sddm-astronaut-theme";
  version = "1.0"; # Можна вказати версію або дату

  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "d73842c761f7d7859f3bdd80e4360f09180fad41"; # Рекомендується замінити на конкретний commit hash для стабільності
    sha256 = "1lvbvs58w1jx2y490vb4vpwqs685rl4mnk952945hzcn2dbidppv"; # Замініть на реальний хеш
  };

  # Для цієї теми часто потрібні додаткові залежності (Qt6/Qt5 Quick components)
  # Якщо ви використовуєте її в NixOS, переконайтеся, що ці пакунки є в sddm.extraPackages

  installPhase = ''
    mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
    cp -R ./* $out/share/sddm/themes/sddm-astronaut-theme/
    cd $out/share/sddm/themes/sddm-astronaut-theme
    cp ${../../media/wallpaper_1980x1080.png} Backgrounds/wallpaper.png
    sed -i 's|FormPosition=.*|FormPosition="left"|' Themes/astronaut.conf
    sed -i 's|Background=.*|Background="Backgrounds/wallpaper.png"|' Themes/astronaut.conf
      
  '';
}
