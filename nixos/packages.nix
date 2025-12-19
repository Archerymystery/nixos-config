{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    fish
    fastfetch
    pkgs.wl-clipboard
    firefox
    kitty
    hyprpaper
    waybar
    wofi
    telegram-desktop
    yazi
    home-manager
    pavucontrol
    git
    vscode
    #   python3
    pkgs.python314
    #    (python3.withPackages (ps: with ps; [ numpy requests ]))
    sqlitebrowser
    nixpkgs-fmt
    catppuccin-cursors
    hyprcursor
    arduino-ide
    dracula-theme
    ocs-url
    discord
    grimblast
    sl
    bat
    bottom
    pnpm
    nodejs
    nodemon
    tree
    krita
    unzip
    vesktop
    gcc
    libGL
    libGLU
    glfw
    glew
    freeglut
    gnome-disk-utility
    udisks2
    util-linux
    #    gtest
    #    cmake
    #    qtcreator
    #    qt5.full
    brightnessctl
    obs-studio
    #    kdePackages.umbrello
  ];


  services.udev.packages = [
    pkgs.android-udev-rules
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
  ];
}
