{self, ...}: {
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

        wayland.windowManager.niri = {
          enable = true;
          settings = {
            environment."NIXOS_OZONE_WL" = "1";
            input.keyboard.xkb.layout = "dk";
            layout = {
              gaps = 8;
              focus-ring.off = {};
              border = {
                active-color = "#${config.lib.stylix.colors.base0D}";
                inactive-color = "#${config.lib.stylix.colors.base03}";
              };
            };

            cursor = {
              xcursor-theme = config.home.pointerCursor.name;
              xcursor-size = config.home.pointerCursor.size;
            };

            prefer-no-csd = {};
            hotkey-overlay.skip-at-startup = {};
            _children = [
              {spawn-at-startup._args = ["swaybg" "-i" "${self.wallpapers.mountain}"];}
              {spawn-at-startup._args = ["noctalia"];}
              {
                window-rule._children = [
                  {geometry-corner-radius = 6.0;}
                  {clip-to-geometry = true;}
                ];
              }
              {
                window-rule._children = [
                  {match._props = {app-id = "^foot$";};}
                  {opacity = 0.90;}
                ];
              }
            ];
          };
        };
      }

      (lib.mkIf config.myNiri.dualMonitor.enable {
        wayland.windowManager.niri.settings._children = [
          {
            output = {
              _args = ["DP-2"];
              focus-at-startup = {};

              mode = "2560x1440@240.001";
              position._props = {
                x = 0;
                y = 0;
              };
              scale = 1.0;
            };
          }
          {
            output = {
              _args = ["HDMI-A-2"];
              mode = "1920x1080@60.0";
              position._props = {
                x = 2560;
                y = 0;
              };
              scale = 1.0;
            };
          }
        ];
      })
    ];
  };
}
