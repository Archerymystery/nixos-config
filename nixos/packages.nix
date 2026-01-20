{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    #    neovim
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
    brightnessctl
    obs-studio
    nix-prefetch-git
    zoom-us
    gparted
    polkit_gnome
    (pkgs.callPackage ./custom_pakages/wofi-calc.nix { })
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
