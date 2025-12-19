{
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      term = "kitty";
      image_size = 24;
      width = 500;
      height = 300;
      prompt = "◅(´⌯⩊⌯`)▻";
    };
    style = ''
              window {
        border-radius: 6px;
        background-color: #181818;
        border-image: linear-gradient(#e25656, #e5d487) 45;
        border-width: 1px;
        border-style: solid;
        border-radius: 7px;
      }

      #input {
        box-shadow: none;
        margin: 10px;
        border-radius: 0px;
        border: none;
        outline: none;
        background-color: #1f1f1f;
        color: white;
        caret-color: white;
      }

      #input:focus {
        outline: none;
      }

      #scroll {
        margin: 2px;
      }

      #entry:selected {
        background: #1f1f1f;
        outline: none;
      }
      #entry {
      color:rgb(141, 141, 141); }
    '';
  };
}
