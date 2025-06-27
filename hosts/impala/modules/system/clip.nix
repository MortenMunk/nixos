{pkgs, ...}: {
    home.packages = with pkgs; [
        wl-clipboard
        cliphist
        wl-clipboard-x11
        wl-clip-persist
    ];

    services.cliphist = {
        enable = true;
    };
}