{...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";

      modules-left = ["clock" "tray"];
      modules-center = ["niri/workspaces"];
      modules-right = ["network" "cpu" "memory" "temperature"];

      clock = {
        format = "{:%I:%M:%S %p} ";
        interval = 1;
        tooltip-format = "<tt>{calendar}</tt>";
        calendar.format.today = "<span color='#fAfBfC'><b>{}</b></span>";
        actions = {
          on-click-right = "shift_down";
          on-click = "shift_up";
        };
      };

      network = {
        format-ethernet = "";
        format-disconnected = "";
        tooltip-format-disconnected = "Error";
        tooltip-format-ethernet = "{ifname}";
        on-click = "nmtui";
      };

      cpu = {
        format = "sovs";
        tooltip = true;
      };

      memory = {
        format = "sovs";
      };

      temperature = {
        critical-threshold = 80;
        format = "sovs";
      };

      tray = {
        icon-size = 14;
        spacing = 10;
      };
    };
  };
}
