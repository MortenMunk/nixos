{pkgs, ...}: {
    home.packages = with pkgs; [
        hyprpaper
    ];

    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            preload = [
                "/etc/nixos/wallpapers/nixos.png"
            ];
            wallpaper = [
                ", /etc/nixos/wallpapers/nixos.png"
            ];
        };
    };
}
