{pkgs, ...}: {
    home.packages = with pkgs; [
        zathura
        imv
        mpv
	unzip
    ];

    programs = {
        zathura.enable = true;
        imv.enable = true;
        mpv.enable = true;
    };
}
