{
  flake.neovimModules.keymaps =
    { ... }:
    {
      vim.keymaps = [
        #--- Navigation ---
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
          desc = "Close buffer";
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
          desc = "Toggle Neo-tree git status tree";
        }
        #--- git ---
        {
          mode = "n";
          key = "<leader>gc";
          action = ":Telescope git_commits<CR>";
          desc = " Select git commits";
        }
        {
          mode = "n";
          key = "<leader>gb";
          action = ":Telescope git_branches<CR>";
          desc = " Select git branch";
        }
      ];
    };
}
