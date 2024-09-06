{pkgs, ...}: {
    home.packages = with pkgs; [
        dunst
    ];

    services.dunst = {
        enable = true;
    };
}