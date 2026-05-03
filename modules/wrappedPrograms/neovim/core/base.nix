{
  flake.neovimModules.base =
    { ... }:
    {
      vim = {
        theme = {
          enable = true;
          name = "rose-pine";
          style = "moon";
        };

        opts = {
          number = true;
          shiftwidth = 2;
        };
        viAlias = true;
        vimAlias = true;
      };
    };
}
