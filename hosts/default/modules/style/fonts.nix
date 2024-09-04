{pkgs, ...}: {

    home.packages = with pkgs; [
        jetbrains-mono
        nerdfonts
    ];

    fonts.fontconfig.enable = true;

}