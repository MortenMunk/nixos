{self, ...}: {
  flake.homeModules.myCli = {pkgs, ...}: {
    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting = {
          enable = true;
        };
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

        eza = {
          enable = true;
          enableZshIntegration = true;
          icons = "auto";
        };

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "direnv"
          ];

          theme = "kafeitu";
        };
      };

      btop.enable = true;
      kitty.enable = true;
      fastfetch.enable = true;
      bat.enable = true;

      direnv = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };

      yazi = {
        enable = true;
        shellWrapperName = "y";
        enableZshIntegration = true;
      };

      zoxide = {
        enable = true;
        enableZshIntegration = true;
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
