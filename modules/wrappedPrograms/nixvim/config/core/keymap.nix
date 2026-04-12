{
  flake.nixvimModules.keymap = {

    # Активуємо самі плагіни без внутрішніх keymaps
    globals.mapleader = " ";

    keymaps = [
      # --- Navigation ---
      {
        mode = "n";
        key = "<C-k>";
        action = ":wincmd k<CR>";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = ":wincmd l<CR>";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = ":wincmd j<CR>";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = ":wincmd h<CR>";
      }

      # --- Bufferline ---
      {
        mode = "n";
        key = "<Tab>";
        action = ":BufferLineCycleNext<CR>";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = ":BufferLineCyclePrev<CR>";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = ":BufferLinePickClose<CR>";
        options = {
          desc = "Close buffer";
        };
      }

      # --- Commnet ----
      {
        mode = "n";
        key = "<leader>/";
        action = "gcc";
        options = {
          remap = true;
          desc = "Toggle comment";
        };
      }
      {
        mode = "v";
        key = "<leader>/";
        action = "gc";
        options = {
          remap = true;
          desc = "Toggle comment";
        };
      }

      # --- Neo-tree ---
      {
        mode = "n";
        key = "<C-e>";
        action = ":Neotree filesystem reveal left toggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>ge";
        action = ":Neotree git_status toggle<CR>";
        options = {
          desc = "Toggle Neo-tree git status tree";
        };
      }

      # --- Telescope ---
      {
        mode = "n";
        key = "<leader>ff";
        action = ":Telescope find_files<CR>";
        options = {
          desc = "󰈔 Find Files";
        };
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = ":Telescope live_grep<CR>";
        options = {
          desc = "󰈞 Find string";
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = ":Telescope buffers<CR>";
        options = {
          desc = " Find buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = ":Telescope git_commits<CR>";
        options = {
          desc = " Select git commits";
        };
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = ":Telescope git_branches<CR>";
        options = {
          desc = " Select git branch";
        };
      }
      # --- ESP32 ---
      {
        mode = "n";
        key = "<leader>eM";
        action.__raw = ''function() require("esp32").pick("monitor") end'';
        options = {
          desc = "ESP32: Pick & Monitor";
        };
      }

      {
        mode = "n";
        key = "<leader>em";
        action.__raw = ''function() require("esp32").command("monitor") end'';
        options = {
          desc = "ESP32: Monitor";
        };
      }

      {
        mode = "n";
        key = "<leader>eF";
        action.__raw = ''function() require("esp32").pick("flash") end'';
        options = {
          desc = "ESP32: Pick & Flash";
        };
      }

      {
        mode = "n";
        key = "<leader>ef";
        action.__raw = ''function() require("esp32").command("flash") end'';
        options = {
          desc = "ESP32: Flash";
        };
      }
      {
        mode = "n";
        key = "<leader>ec";
        action.__raw = ''function() require("esp32").command("menuconfig") end'';
        options = {
          desc = "ESP32: Configure";
        };
      }
      {
        mode = "n";
        key = "<leader>eC";
        action.__raw = ''function() require("esp32").command("clean") end'';
        options = {
          desc = "ESP32: Clean";
        };
      }

      {
        mode = "n";
        key = "<leader>eb";
        action = ":ESPBuild<CR>";
        options = {
          desc = "ESP32: Build";
        };

      }

    ];

  };
}
