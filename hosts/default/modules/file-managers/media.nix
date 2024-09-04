{pkgs, ...}: {
    home.packages = with pkgs; [
        zathura
        imv
        mpv
    ];

    programs = {
        zathura.enable = true;
        imv.enable = true;
        mpv.enable = true;
    };
}