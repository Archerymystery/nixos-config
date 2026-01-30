{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx EDITOR "nvim"     
      starship init fish | source
      fastfetch
    '';
  };
}
