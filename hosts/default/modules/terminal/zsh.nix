{pkgs, ...}: {

  home.packages = with pkgs; [
    bat
    eza
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
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
      rswitch = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      rboot = "sudo nixos-rebuild boot --flake /etc/nixos#default";
      nixfiles = "cd ~/../etc/nixos/";
      config = "cd ~/.config/";
      home = "cd ~/home/morten/";
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
  };
}
