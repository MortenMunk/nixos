{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        floating = true;
        density = "compact";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "MediaMini";
            }
            {
              id = "ActiveWindow";
            }
          ];

          center = [
            {
              id = "Workspace";
              labelMode = "none";
            }
          ];

          right = [
            {
              id = "Volume";
            }
            {
              id = "Network";
            }
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {id = "Network";}
            {id = "NoctaliaPerformance";}
          ];
          right = [
            {id = "Notifications";}
            {id = "NightLight";}
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
      location = {
        monthBeforeDay = false;
        name = "Copenhagen, Denmark";
      };
      wallpaper = {
        enabled = false;
      };
      dock = {
        enabled = false;
      };
    };
  };
}
