{
  flake.neovimModules.comment-nvim =
    { ... }:
    {
      vim = {
        comments.comment-nvim.enable = true;
      };
    };
}
