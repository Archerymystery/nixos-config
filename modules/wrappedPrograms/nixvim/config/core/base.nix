{
  flake.nixvimModules.base =
    { pkgs, ... }:
    {
      extraPackages = with pkgs; [ ripgrep ];
      opts = {
        number = true;
        shiftwidth = 2;
      };
      viAlias = true;
      vimAlias = true;
    };
}
