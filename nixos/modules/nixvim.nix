{ config, pkgs, lib, ... }:

{
  # 1. Enable nixvim as a program
  programs.nixvim = {
    enable = true;

    # 2. Import your nixvim configuration
    # Assuming you have a way to access your nixvim folder (e.g., it's a module 
    # included via your flake or a local path).
    imports = [
      ./bufferline.nix
      ./lualine.nix
      ./lsp.nix
      ./cmp.nix
      ./conform-nvim.nix
      ./tree.nix
      ./toggleterm.nix
      ./dashboard.nix
      #    ./telescope.nix
    ];
    colorschemes.rose-pine.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.transparent = {
      enable = true;
      settings = {
        # Групи, для яких потрібно встановити прозорий фон.
        # Це стандартні групи Neovim.
        groups = [
          "Normal"
          "NormalNC"
          "Comment"
          "Constant"
          "Special"
          "Identifier"
          "Statement"
          "PreProc"
          "Type"
          "Underlined"
          "Todo"
          "String"
          "Function"
          "Conditional"
          "Repeat"
          "Operator"
          "Structure"
          "LineNr"
          "NonText"
          "SignColumn"
          "CursorLine"
          "NvimTreeNormal" # Для популярного плагіна NvimTree
          "NormalFloat" # Для спливаючих вікон плагінів (Mason, LSP, Lazy)
        ];
      };
    };
    opts = {
      number = true;
      shiftwidth = 2; # Tab width should be 2
    };

  };

  # ... other NixOS configurations
}
