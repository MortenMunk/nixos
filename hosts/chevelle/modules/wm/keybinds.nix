{config, ...}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Q".action = spawn "kitty";
    "Mod+C".action = close-window;
    "Mod+R".action = spawn "rofi" "-show" "drun";
  };
}
