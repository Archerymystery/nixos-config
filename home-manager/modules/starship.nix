{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$username $directory $python$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status$cmd_duration \n$os$character ";
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        format = "$symbol";
      };
      username = {
        style_user = "#fc6203 bold";
        style_root = "black bold";
        format = "[$user]($style)";
        disabled = false;
        show_always = true;
      };
      os = {
        disabled = false;
        style = "bold #61afef";
        symbols = {
          NixOS = "󱄅 ";
        };
      };
      battery = {
        format = "[$symbol$percentage]($style) ";
        charging_symbol = " ";
        discharging_symbol = " ";
        empty_symbol = " ";
        full_symbol = " ";
        unknown_symbol = " ";
        disabled = false;
        display = [
          {
            style = "red bold";
            threshold = 10;
          }
        ];
      };
      python = {
        format = "[$symbol$pyenv_prefix($version )(($virtualenv) )]($style)";
        python_binary = [
          "python"
          "python3"
          "python2"
        ];
        pyenv_prefix = "pyenv ";
        pyenv_version_name = true;
        style = "yellow bold";
        symbol = " ";
        version_format = "v$raw";
        disabled = false;
        detect_extensions = [ "py" ];
        #     detect_files = [
        #        "requirements.txt"
        #        ".python-version"
        #        "pyproject.toml"
        #       "Pipfile"
        #        "tox.ini"
        #       "setup.py"
        #     "__init__.py"
        #    ];
        detect_folders = [ ];
      };
      nodejs = {
        format = "[$symbol($version )]($style)";
        not_capable_style = "bold red";
        style = "bold green bg:0x86BBD8";
        symbol = " ";
        version_format = "v$raw";
        disabled = false;
        detect_extensions = [
          "js"
          "mjs"
          "cjs"
          "ts"
          "mts"
          "cts"
        ];
        detect_files = [
          "package.json"
          ".node-version"
          ".nvmrc"
        ];
        detect_folders = [ "node_modules" ];
      };

    };
  };
}
