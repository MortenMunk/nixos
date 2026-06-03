{
  self,
  lib,
  ...
}: {
  flake.homeModules.myNiri = {
    config,
    lib,
    pkgs,
    ...
  }: {
    options.myNiri.dualMonitor.enable = lib.mkEnableOption "Dual monitor output layout for Niri";
    config = lib.mkMerge [
      {
        home.packages = with pkgs; [
          swaybg
        ];

        programs.niri.settings = {
          environment."NIXOS_OZONE_WL" = "1";
          input.keyboard.xkb.layout = "dk";

          spawn-at-startup = [
            {argv = ["swaybg" "-i" "${self.wallpapers.mountain}"];}
            {command = ["noctalia-shell"];}
          ];

          prefer-no-csd = true;

          xwayland-satellite = {
            enable = true;
            path = lib.getExe pkgs.xwayland-satellite;
          };

          hotkey-overlay.skip-at-startup = true;
          layout.gaps = 8;

          window-rules = [
            {
              geometry-corner-radius = {
                bottom-left = 6.0;
                bottom-right = 6.0;
                top-left = 6.0;
                top-right = 6.0;
              };
              clip-to-geometry = true;
            }
            {
              matches = [{app-id = "^foot$";}];
              opacity = 0.90;
            }
          ];
        };
      }

      (lib.mkIf config.myNiri.dualMonitor.enable {
        programs.niri.settings.outputs = {
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
            # prevent flicker
            variable-refresh-rate = false;
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
      })
    ];
  };
}
