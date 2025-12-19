{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        quiet = true;
      };

      formatters_by_ft = {

        typescript = [ "prettierd" ];
        javascript = [ "prettierd" ];
        json = [ "prettierd" ];
        python = [ "black" ];
        nix = [ "nixpkgs_fmt" ];
        rust = [ "rustfmt" ];
        sh = [ "shfmt" ];


      };
    };
  };
}
