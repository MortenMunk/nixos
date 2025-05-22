{config, ...}: let
  stylix = config.lib.stylix.colors.withHashtag;
  color = {
    rd = stylix.base08;
    orng = stylix.base09;
    blu = stylix.base0D;
    blu2 = stylix.base0C;
    orng2 = stylix.base0F;
    bg = stylix.base00;
    transparent = "rgba(0,0,0,0)";
  };

  border = {
    width = "2px";
    radius = "5px";
  };
in {
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
      }

      window#waybar {
        background-color: ${color.transparent};
      }

      #custom-os_button {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        color: ${color.blu};
        font-size: 24px;
        padding-left: 6px;
        padding-right: 12px;
        background-color: ${color.bg};
      }

      #workspaces {
        border-radius: ${border.radius};
        border: ${border.width} solid ${color.blu};
        background-color: ${color.bg};
      }

      #workspaces button.active {
        color: ${color.blu2};
      }

      #workspaces button {
        color: ${color.blu};
      }

      .modules-left {
        margin-top: 5px;
        margin-left: 10px;
        background-color: ${color.transparent};
      }

      .modules-center {
        margin-top: 5px;
        font-weight: bold;
        background-color: ${color.bg};
        color: ${color.blu};
        border-radius: ${border.radius};
        border: ${border.width} solid ${color.blu};
        padding-left: 20px;
        padding-right: 20px;
      }

      .modules-right {
        margin-top: 5px;
        margin-right: 10px;
        background-color: ${color.transparent};
      }

      #custom-separator {
        color: ${color.blu};
      }

      #clock.time {
        color: ${color.blu};
      }

      #clock.calendar {
        color: ${color.blu};
      }

      #tray {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        background-color: ${color.bg};
      }

      #tray.needs-attention {
        border-radius: ${border.radius};
      }

      #temperature {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        color: ${color.blu};
        background-color: ${color.bg};
      }

      #temperature.critical {
        color: ${color.rd};
      }

      #cpu {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        color: ${color.blu};
        background-color: ${color.bg};
      }

      #cpu.low {
        color: ${color.blu};
      }

      #cpu.lower-medium {
        color: ${color.blu};
      }

      #cpu.medium {
        color: ${color.orng};
      }

      #cpu.upper-medium {
        color: ${color.orng2};
      }

      #cpu.high {
        color: ${color.rd};
      }

      #memory {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        color: ${color.blu};
        background-color: ${color.bg};
      }

      #memory.low {
        color: ${color.blu};
      }

      #memory.lower-medium {
        color: ${color.blu};
      }

      #memory.medium {
        color: ${color.orng};
      }

      #memory.upper-medium {
        color: ${color.orng2};
      }

      #memory.high {
        color: ${color.rd};
      }

      #disk {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        color: ${color.blu};
        background-color: ${color.bg};
      }

      #disk.low {
        color: ${color.blu};
      }

      #disk.lower-medium {
        color: ${color.blu};
      }

      #disk.medium {
        color: ${color.orng}
      }

      #disk.upper-medium {
        color: ${color.orng2};
      }

      #disk.high {
        color: ${color.rd};
      }

      #battery {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        color: ${color.blu};
        background-color: ${color.bg};
      }

      #battery.low {
        color: ${color.rd};
      }

      #battery.lower-medium {
        color: ${color.orng2};
      }

      #battery.medium {
        color: ${color.orng};
      }

      #battery.upper-medium {
        color: ${color.blu};
      }

      #battery.high {
        color: ${color.blu};
      }

      #pulseaudio {
        border: ${border.width} solid ${color.blu};
        border-radius: ${border.radius};
        padding-left: 15px;
        padding-right: 15px;
        color: ${color.blu};
        background-color: ${color.bg};
      }
    '';

    settings = {
      top_bar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;
        modules-left = [
          "custom/os_button"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock#time"
          "custom/separator"
          "clock#calendar"
        ];
        modules-right = [
          "tray"
          "temperature"
          "cpu"
          "memory"
          "disk"
          "battery"
          "pulseaudio"
        ];

        "custom/os_button" = {
          format = "󱄅";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          persistent-workspaces = {
            "*" = 10;
          };
        };

        "custom/separator" = {
          format = "|";
          tooltip = false;
        };

        "clock#calendar" = {
          format = "{:%F}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          mode = "year";
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll-right = "mode";
            format = {
              months = "<span color='#edb53d'><b>{}</b></span>";
              days = "<span color='#edb53d'><b>{}</b></span>";
              weeks = "<span color='#edb53d'><b>W{}</b></span>";
              weekdays = "<span color='#edb53d'><b>{}</b></span>";
              today = "<span color='#fe8019'><b><u>{}</u></b></span>";
            };
          };
        };

        "clock#time" = {
          format = "{:%H:%M}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#edb53d'><b>{}</b></span>";
              days = "<span color='#edb53d'><b>{}</b></span>";
              weeks = "<span color='#edb53d'><b>W{}</b></span>";
              weekdays = "<span color='#edb53d'><b>{}</b></span>";
              today = "<span color='#fe8019'><b><u>{}</u></b></span>";
            };
          };
        };

        cpu = {
          format = "󰻠 {usage}%";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "kitty btop";
        };

        temperature = {
          interval = 10;
          tooltip = false;
          thermal-zone = 0;
          critical-threshold = 80;
          format = " {temperatureC}°C";
        };

        memory = {
          format = "  {percentage}%";
          tooltip-format = "Main: ({used} GiB/{total} GiB)({percentage}%), available {avail} GiB";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "kitty btop";
        };

        disk = {
          format = "󰋊 {percentage_used}%";
          tooltip-format = "({used}/{total})({percentage_used}%) in '{path}', available {free}({percentage_free}%)";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "kitty btop";
        };

        battery = {
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          format = "{icon}{capacity}%";
          format-charging = "󱐋{icon}{capacity}%";
          format-plugged = "󰚥{icon}{capacity}%";
          format-time = "{H} h {M} min";
          format-icons = [
            "󱃍 "
            "󰁺 "
            "󰁻 "
            "󰁼 "
            "󰁽 "
            "󰁾 "
            "󰁿 "
            "󰂀 "
            "󰂁 "
            "󰂂 "
            "󰁹 "
          ];
          tooltip-format = "{timeTo}";
        };

        tray = {
          icon-size = 20;
          spacing = 2;
        };

        "pulseaudio" = {
          tooltip-format = "{desc}\n{format_source}";
          format = "{icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-icons = {
            headphone = "󰋋 ";
            hands-free = " ";
            headset = "󰋎 ";
            phone = "󰄜 ";
            portable = "󰦧 ";
            car = "󰄋 ";
            hdmi = "󰡁 ";
            hifi = "󰋌 ";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pwvucontrol";
        };
      };
    };
  };
}
