{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-emoji-wayland];
    extraConfig = {
      modi = "drun,run,filebrowser";
      show-icons = true;
    };
  };
}
