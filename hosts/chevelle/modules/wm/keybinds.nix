{config, ...}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Super+Q".action = spawn "kitty";
    "Super+C".action = close-window;
    "Super+R".action = spawn "rofi" "-show" "drun";
  };
}
