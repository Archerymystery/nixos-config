{ pkgs, ... }:

let
  # Визначаємо нашу тему як локальну змінну
  astronaut-theme = pkgs.callPackage ./sddm-theme.nix { };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    # 1. Вказуємо назву теми (вона має збігатися з назвою папки в $out/share/sddm/themes)
    theme = "sddm-astronaut-theme";

    # 2. Додаємо пакет з темою та необхідні Qt-бібліотеки
    extraPackages = with pkgs; [
      astronaut-theme
      # Astronaut Theme (особливо нові версії) потребує цих пакетів для роботи:
      # kdePackages.qt6physics # Часто потрібен для ефектів
      kdePackages.qtmultimedia
      kdePackages.qtsvg
    ];
  };

  # Також переконайтеся, що пакет теми додано до системних (опціонально, але корисно)
  environment.systemPackages = [ astronaut-theme ];
}
