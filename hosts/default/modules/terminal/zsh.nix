{pkgs, ...}: {

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            ".." = "cd ../";
            "...." = "cd ../../";
            "......" = "cd ../../../";
            rswitch = "sudo nixos-rebuild switch --flake /etc/nixos#default";
            rboot = "sudo nixos-rebuild boot --flake /etc/nixos#default";
            nixfiles = "cd /etc/nixos/";
            config = "cd ~/.config/";
            home = "cd ~/home/morten/";
        };

        oh-my-zsh = {
            enable = true;
            plugins = ["git"];
            theme = "robbyrussell";
        };
    };
}