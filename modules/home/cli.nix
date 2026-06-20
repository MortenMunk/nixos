_: {
  flake.homeModules.myCli = {pkgs, ...}: {
    programs = {
      fish = {
        enable = true;
        generateCompletions = true;
        interactiveShellInit = ''
          set -g fish_greeting ""
          set -g fish_color_command white --bold
        '';
        shellAliases = {
          cat = "bat";
          xo = "xdg-open";
          lg = "${pkgs.lazygit}/bin/lazygit";
          f = "${pkgs.yazi}/bin/yazi";
          ".." = "cd ../";
          "...." = "cd ../../";
          "......" = "cd ../../../";
          nixfiles = "cd ~/../../etc/nixos/";
          config = "cd ~/.config/";
          software = "cd ~/software/";
        };
      };

      starship = {
        enable = true;
        enableInteractive = false;
        enableFishIntegration = true;
        settings = {
          add_newline = false;
          format = "[➜](bold red) $username$hostname$directory$git_branch$git_status ";
          username = {
            show_always = true;
            format = "[$user]($style)";
          };
          hostname = {
            ssh_only = false;
            format = "[@$hostname]($style) ";
          };

          directory = {
            format = "[$path]($style) ";
            truncate_to_repo = false;
            truncation_length = 0;
          };

          git_branch = {
            format = "[git:\\(](bold blue)[$branch](bold red)[\\)](bold blue)";
          };

          git_status = {
            format = " [✗](bold yellow)";
          };
        };
      };

      eza = {
        enable = true;
        enableFishIntegration = true;
        icons = "auto";
      };

      btop.enable = true;
      foot.enable = true;
      fastfetch.enable = true;
      bat.enable = true;

      direnv = {
        enable = true;
        enableFishIntegration = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };

      yazi = {
        enable = true;
        shellWrapperName = "y";
        enableFishIntegration = true;
      };

      zoxide = {
        enable = true;
        enableFishIntegration = true;
        options = [
          "--cmd cd"
        ];
      };
    };

    home.packages = with pkgs; [
      unzip
      tree
    ];
  };
}
