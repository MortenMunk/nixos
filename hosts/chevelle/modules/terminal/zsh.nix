{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    eza
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      cat = "${pkgs.bat}/bin/bat";
      l = "${pkgs.eza}/bin/eza --icons --group-directories-first --group --long --all";
      ll = "${pkgs.eza}/bin/eza --icons --group-directories-first --group --long";
      la = "${pkgs.eza}/bin/eza --icons --group-directories-first --group --long --all -all";
      xo = "xdg-open";
      lg = "${pkgs.lazygit}/bin/lazygit";
      c = "clear";
      f = "${pkgs.yazi}/bin/yazi";
      ".." = "cd ../";
      "...." = "cd ../../";
      "......" = "cd ../../../";
      nixfiles = "cd ~/../../etc/nixos/";
      config = "cd ~/.config/";
      home = "cd";
      software = "cd ~/software/";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "direnv"
      ];

      theme = "kafeitu";
    };

    initContent = ''
      function current_dir() {
          local current_dir=$PWD
          if [[ $current_dir == $HOME ]]; then
              current_dir="~"
          else
              current_dir=''${current_dir##*/}
          fi

          echo $current_dir
      }

      function change_tab_title() {
          local title=$1
          command nohup zellij action rename-tab $title >/dev/null 2>&1
      }

      function set_tab_to_working_dir() {
          local result=$?
          local title=$(current_dir)
          # uncomment the following to show the exit code after a failed command
          # if [[ $result -gt 0 ]]; then
          #     title="$title [$result]"
          # fi

          change_tab_title $title
      }

      function set_tab_to_command_line() {
          local cmdline=$1
          change_tab_title $cmdline
      }

      if [[ -n $ZELLIJ ]]; then
          add-zsh-hook precmd set_tab_to_working_dir
          add-zsh-hook preexec set_tab_to_command_line
      fi
    '';
  };
}
