{
  flake.neovimModules.neo-tree =
    { ... }:
    {
      vim = {
        filetree.neo-tree.enable = true;
      };
    };
}
