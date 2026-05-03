{
  flake.neovimModules.lsp =
    { ... }:
    {
      vim = {
        lsp = {
          enable = true;
          formatOnSave = true; 
          lightbulb.enable = true; 
        };

        
        languages = {
          enableTreesitter = true; 
          enableExtraDiagnostics = true;

          
          clang = {
            enable = true;
            lsp.enable = true;
            lsp.servers = ["clangd"]; 
         
          };

          
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true; 
            format = {
              enable = true;
              type = ["rustfmt"];
            };
          };

          
          python = {
            enable = true;
            format = {
              enable = true;
              type = ["black"]; 
            };
            lsp.enable = true;
            lsp.servers =["pyright"];
          };

          
          nix = {
            enable = true;
            format = {
              enable = true;
              type = ["nixfmt"]; 
            };
            lsp.enable = true;
            lsp.servers = ["nil"]; 
          };
	  bash = {
      enable = true;
      lsp = {
        enable = true;
        servers = [ "bash-language-server" ];
      };
      format = {
        enable = true;
        type = ["shfmt"]; 
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
