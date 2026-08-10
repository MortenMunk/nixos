_: {
  flake.homeModules.myNiriKeybinds = {
    config,
    lib,
    ...
  }: {
    options.myNiri.screenshotKey = lib.mkOption {
      type = lib.types.str;
      default = "Print";
      description = "The keybind to trigger screenshot.";
    };

    config = {
      wayland.windowManager.niri.settings.binds = lib.mkMerge [
        {
          # Spawn
          "Mod+Q".spawn = ["foot"];
          "Mod+R".spawn = ["vicinae" "toggle"];

          # Lifecycles
          "Mod+C".close-window = {};
          "Mod+F".fullscreen-window = {};
          "Mod+Shift+F".toggle-windowed-fullscreen = {};
          "Mod+Space".toggle-window-floating = {};

          "Mod+Ctrl+Tab".switch-focus-between-floating-and-tiling = {};
          "Mod+Shift+Space".move-window-to-floating = {};
          "Mod+Ctrl+Space".move-window-to-tiling = {};

          "Mod+Ctrl+Minus".set-column-width = "-10%";
          "Mod+Ctrl+Plus".set-column-width = "+10%";

          "Mod+Shift+M".center-column = {};
          "Mod+M".maximize-column = {};

          # Focus (Vim)
          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right = {};
          "Mod+K".focus-window-up = {};
          "Mod+J".focus-window-down = {};

          # Focus (Arrows)
          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};

          # Move (Vim)
          "Mod+Shift+H".move-column-left = {};
          "Mod+Shift+L".move-column-right = {};
          "Mod+Shift+K".move-window-up = {};
          "Mod+Shift+J".move-window-down = {};

          # Move (Arrows)
          "Mod+Shift+Left".move-column-left = {};
          "Mod+Shift+Right".move-column-right = {};
          "Mod+Shift+Up".move-window-up = {};
          "Mod+Shift+Down".move-window-down = {};

          # Workspaces (Numerical)
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;

          "Mod+Shift+1".move-window-to-workspace-down._props = {focus = true;};
          "Mod+Shift+2".move-window-to-workspace-up._props = {focus = true;};

          # Workspaces (Scroll Vim)
          "Mod+Ctrl+J".focus-workspace-down = {};
          "Mod+Ctrl+K".focus-workspace-up = {};

          # Workspace (Scroll Arrows)
          "Mod+Ctrl+Down".focus-workspace-down = {};
          "Mod+Ctrl+Up".focus-workspace-up = {};

          # Screenshot
          ${config.myNiri.screenshotKey}.screenshot._props = {show-pointer = false;};
        }

        (lib.mkIf config.myNiri.dualMonitor.enable {
          # Monitor focus (Vim)
          "Mod+Alt+H".focus-monitor-left = {};
          "Mod+Alt+L".focus-monitor-right = {};

          "Mod+Alt+Shift+H".move-window-to-monitor-left = {};
          "Mod+Alt+Shift+L".move-window-to-monitor-right = {};

          # Monitor Focus (Arrows)
          "Mod+Alt+Left".focus-monitor-left = {};
          "Mod+Alt+Right".focus-monitor-right = {};

          "Mod+Alt+Shift+Left".move-window-to-monitor-left = {};
          "Mod+Alt+Shift+Right".move-window-to-monitor-right = {};

          # Overview'
          "Mod+Tab".toggle-overview = {};
          "Mod+F1".show-hotkey-overlay = {};
        })
      ];
    };
  };
}
