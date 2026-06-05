{
  flake.neovimModules.lsp =
    { lib, ... }:
    {
      vim = {
        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          #   servers.clangd = {
          #     cmd = lib.mkForce [
          #       "clangd"
          #       "--header-insertion=never"
          #       "--background-index"
          #     ];
          #     initOptions = {
          #       fallbackFlags = [ "-std=c++23" ];
          #     };
          #   };
          servers.nixd = {
            settings = {
              nixd = {
                nixpkgs = {
                  expr = "import <nixpkgs> { }";
                };
                formatting = {
                  command = [ "nixfmt" ];
                };
              };
            };
          };
        };
        autocmds = [
          {
            event = [ "BufWritePre" ];
            pattern = [
              "*.c"
              "*.h"
              "*.cpp"
            ];
            command = "lua vim.lsp.buf.format()";
          }
        ];
        languages = {
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          clang = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "clangd" ];

          };

          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
            format = {
              enable = true;
              type = [ "rustfmt" ];
            };
          };

          python = {
            enable = true;
            format = {
              enable = true;
              type = [ "black" ];
            };
            lsp.enable = true;
            lsp.servers = [ "pyright" ];
          };

          nix = {
            enable = true;
            format = {
              enable = true;
              type = [ "nixfmt" ];
            };
            lsp = {
              enable = true;
              servers = [ "nixd" ];
            };
          };
          bash = {
            enable = true;
            lsp = {
              enable = true;
              servers = [ "bash-language-server" ];
            };
            format = {
              enable = true;
              type = [ "shfmt" ];
            };
          };

          cmake = {
            enable = true;
            lsp = {
              enable = true;
              servers = [ "neocmakelsp" ];
            };
          };

          make = {
            enable = true;

          };
        };
      };
    };
}
