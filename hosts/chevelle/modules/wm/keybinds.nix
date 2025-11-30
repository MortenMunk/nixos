{config, ...}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # Spawn
    "Mod+Q".action = spawn "kitty";
    "Mod+R".action = spawn "rofi" "-show" "drun";

    # Lifecycles
    "Mod+C".action = close-window;
    "Mod+F".action = fullscreen-window;
    "Mod+Shift+F".action = toggle-windowed-fullscreen;
    "Mod+Space".action = toggle-window-floating;

    # Focus (Vim)
    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+K".action = focus-window-up;
    "Mod+J".action = focus-window-down;

    # Focus (Arrows)
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Up".action = focus-window-up;
    "Mod+Down".action = focus-window-down;

    # Move (Vim)
    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-window-up;
    "Mod+Shift+J".action = move-window-down;

    # Move (Arrows)
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Up".action = move-window-up;
    "Mod+Shift+Down".action = move-window-down;

    # Workspaces (Numerical)
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;

    "Mod+Shift+1".action = move-window-to-workspace-down {focus = true;};
    "Mod+Shift+2".action = move-window-to-workspace-up {focus = true;};

    # Workspaces (Scroll Vim)
    "Mod+Ctrl+J".action = focus-workspace-down;
    "Mod+Ctrl+K".action = focus-workspace-up;

    # Workspace (Scroll Arrows)
    "Mod+Ctrl+Down".action = focus-workspace-down;
    "Mod+Ctrl+Up".action = focus-workspace-up;

    # Monitor focus (Vim)
    "Mod+Alt+H".action = focus-monitor-left;
    "Mod+Alt+L".action = focus-monitor-right;

    "Mod+Alt+Shift+H".action = move-window-to-monitor-left;
    "Mod+Alt+Shift+L".action = move-window-to-monitor-right;

    # Monitor Focus (Arrows)
    "Mod+Alt+Left".action = focus-monitor-left;
    "Mod+Alt+Right".action = focus-monitor-right;

    "Mod+Alt+Shift+Left".action = move-window-to-monitor-left;
    "Mod+Alt+Shift+Right".action = move-window-to-monitor-right;

    # Overview'
    "Mod+Tab".action = toggle-overview;
    "Mod+F1".action = show-hotkey-overlay;
  };
}
