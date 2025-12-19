{
  plugins.lsp = {
    enable = true;
    servers = {
      ts_ls = {
        enable = true;

      };


      pyright = {
        enable = true;

      };


      bashls = {
        enable = true;

      };


      nil_ls = {
        enable = true;

      };


      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

    };
  };
}
