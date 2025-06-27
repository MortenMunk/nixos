{pkgs, ...}: {

    home.packages = with pkgs; [
        jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
    ];

    fonts.fontconfig.enable = true;

}
