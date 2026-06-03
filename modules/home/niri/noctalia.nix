{
  self,
  inputs,
  ...
}: {
  flake.homeModules.myNoctalia = {
    config,
    lib,
    ...
  }: let
    isLaptop = config.myNoctalia.laptop.enable;
  in {
    options.myNoctalia.laptop.enable = lib.mkEnableOption "Laptop specific settings for noctalia";
    imports = [
      inputs.noctalia.homeModules.default
    ];

    config = {
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
                  formatHorizontal = "HH:mm";
                  formatVertical = "HH mm";
                  id = "Clock";
                  useMonospacedFont = true;
                  usePrimaryColor = true;
                }
              ];
              center = [
                {
                  id = "Workspace";
                  labelMode = "none";
                }
              ];

              right =
                if isLaptop
                then [
                  {id = "Tray";}
                  {id = "NotificationHistory";}
                  {id = "Volume";}
                  {id = "Network";}
                  {
                    deviceNativePath = "__default__";
                    displayMode = "graphic";
                    hideIfIdle = false;
                    hideIfNotDetected = true;
                    id = "Battery";
                    showNoctaliaPerformance = true;
                    showPowerProfiles = true;
                  }
                  {id = "Brightness";}
                  {id = "SystemMonitor";}
                ]
                else [
                  {id = "Volume";}
                  {id = "Network";}
                  {id = "Tray";}
                  {id = "NotificationHistory";}
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
                enabled = isLaptop;
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
    };
  };
}
