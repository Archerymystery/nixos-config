{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "sddm-astronaut-theme";
  version = "1.0"; # Можна вказати версію або дату

  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "master"; # Рекомендується замінити на конкретний commit hash для стабільності
    sha256 = "sha256-0000000000000000000000000000000000000000000="; # Замініть на реальний хеш
  };

  # Для цієї теми часто потрібні додаткові залежності (Qt6/Qt5 Quick components)
  # Якщо ви використовуєте її в NixOS, переконайтеся, що ці пакунки є в sddm.extraPackages

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    
    # Копіюємо ваші шпалери
    # В темі Astronaut зазвичай використовується параметр "Background" у theme.conf.user або metadata.desktop
    mkdir -p $out/Backgrounds
    cp ${../../media/wallpaper.png} $out/Backgrounds/wallpaper.png

    # Налаштування теми через sed
    # Astronaut використовує theme.conf або theme.conf.user
    chmod +w $out/theme.conf
    
    sed -i 's|Background=.*|Background="Backgrounds/wallpaper.png"|' $out/theme.conf
    
    # Додаємо роздільну здатність, якщо це передбачено конфігом
    # Примітка: Astronaut динамічно підлаштовується краще за Sugar Candy, 
    # але ми залишимо логіку за замовчуванням
    sed -i "s/ScreenWidth.*/ScreenWidth=1920/" $out/theme.conf
    sed -i "s/ScreenHeight.*/ScreenHeight=1080/" $out/theme.conf
  '';
}
