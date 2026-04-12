{
  flake.nixvimModules.esp32 =
    { pkgs, ... }:
    let
      esp32 = pkgs.vimUtils.buildVimPlugin {
        name = "esp32-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "Aietes";
          repo = "esp32.nvim";
          rev = "7b929bd908ba7358b073d1923832cd8d2e682503";
          hash = "sha256-+pyR9Ooje3IV/IvLmAp5tx4C4U4Cabdz1dB/VfL1Acg="; # Замініть на реальний хеш
        };
        doCheck = false;
      };
    in
    {
      extraPlugins = [
        {
          plugin = esp32;
          config = "lua require(\"esp32\").setup()";
        }
      ];
      plugins.snacks = {
        enable = true;
      };

    };
}
