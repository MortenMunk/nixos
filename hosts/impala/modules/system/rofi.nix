{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    plugins = [pkgs.rofi-emoji];
    extraConfig = {
      modi = "drun,run,filebrowser";
      show-icons = true;
    };
  };
}
