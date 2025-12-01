{...}: {
  programs.niri.settings = {
    outputs = {
      "DP-2" = {
        enable = true;
        focus-at-startup = true;

        mode = {
          width = 2560;
          height = 1440;
          refresh = 240.001;
        };
        position = {
          x = 0;
          y = 0;
        };

        scale = 1.0;
        variable-refresh-rate = true;
      };

      "HDMI-A-2" = {
        enable = true;

        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };

        position = {
          x = 2560;
          y = 0;
        };

        scale = 1.0;
      };
    };
  };
}
