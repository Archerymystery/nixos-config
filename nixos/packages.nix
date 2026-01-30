{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    fish
    fastfetch
    wl-clipboard
    cliphist
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
    sqlitebrowser
    nixpkgs-fmt
    catppuccin-cursors
    hyprcursor
    dracula-theme
    ocs-url
    discord
    grimblast
    sl
    bat
    bottom
    nodemon
    tree
    krita
    mesa-demos
    clinfo
    unzip
    brightnessctl
    obs-studio
    nix-prefetch-git
    zoom-us
    gparted
    polkit_gnome
    (pkgs.callPackage ./custom_pakages/wofi-calc.nix { })
    (pkgs.callPackage ./custom_pakages/wofi-wifi-menu.nix { })
    playerctl
    mako
    libnotify
    tesseract
    (pkgs.callPackage ./custom_pakages/wofi-screenshot.nix { })
    mpv
    imv
    zenity
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
  ];
}
