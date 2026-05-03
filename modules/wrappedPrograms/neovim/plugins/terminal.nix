{
  flake.neovimModules.terminal =
    { pkgs, ... }:
    {
      vim = {
        utility.direnv.enable = true;
        terminal.toggleterm = {
          mappings.open = "<C-\\>";
          enable = true;
          setupOpts.direction = "float";
        };
      };
    };
}
