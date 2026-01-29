{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar = {
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
      location = {
        monthBeforeDay = false;
        name = "Copenhagen, Denmark";
      };
    };
  };
}
