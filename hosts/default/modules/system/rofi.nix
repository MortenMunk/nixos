{pkgs, ...}: {
    home.packages = with pkgs; [
        rofi-wayland
    ];

    # config is found in ~/.config/rofi until declarative support is added
}