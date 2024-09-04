{pkgs, ...}: {
    home.packages = with pkgs; [
        fish
    ];

    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            echo "Welcome back"
        '';
        shellAliases = {
            ".." = "cd ../";
            "...." = "cd ../../";
            "......" = "cd ../../../";
            rswitch = "sudo nixos-rebuild switch --flake /etc/nixos#default";
            rboot = "sudo nixos-rebuild boot --flake /etc/nixos#default";
            home = "cd /etc/nixos/";
            config = "cd ~/.config/";
        };
    };
}