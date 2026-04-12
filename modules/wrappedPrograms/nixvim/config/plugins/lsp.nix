{
  flake.nixvimModules.lsp = {
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
        cmake = {
          enable = true;
        };
        # ccls = {
        #   enable = true;
        # };
        nixd = {
          enable = true;
        };
        clangd = {
          cmd = [
            "clangd"
            "--background-index"
            "--clang-tidy"
            "--header-insertion=never"
            # Цей прапорець дозволяє clangd використовувати компілятори з nix-shell / flake
            "--query-driver=${"$"}{pkgs.stdenv.cc.cc}/bin/clang++,${"$"}{pkgs.stdenv.cc.cc}/bin/g++"
          ];
          enable = true;
          extraOptions = {
            __raw = ''
              (function()
                local status_ok, esp32 = pcall(require, "esp32")
                if os.getenv("ESP_MODE") == "1" and status_ok then
                  return esp32.lsp_config()
                end
               return {}
              end)()
            '';
          };
        };
      };
    };
  };
}
