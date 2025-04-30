{...}: let
  rd = "#fb4934";
  orng = "#fe8019";
  blu = "#83a598";
  blu2 = "#8ec07c";
  orng2 = "#d65d0e";
  border_width = "2px";
in {
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
      }

      window#waybar {
        background-color: rgba(0,0,0,0);
      }

      #custom-os_button {
        border: ${border_width} solid ${blu};
        border-radius: 5px;
        color: ${blu};
        font-size: 24px;
        padding-left: 6px;
        padding-right: 12px;
      }

      #workspaces {
        border-radius: 5px;
        border: ${border_width} solid ${blu};
      }

      #workspaces button.active {
        color: ${blu2};
      }

      #workspaces button {
        color: ${blu};
      }

      .modules-left {
        margin-top: 5px;
        margin-left: 10px;
      }

      .modules-center {
        margin-top: 5px;
        font-weight: bold;
        background-color: rgba(0,0,0,0);
        color: ${blu};
        border-radius: 5px;
        border: ${border_width} solid ${blu};
        padding-left: 20px;
        padding-right: 20px;
      }

      .modules-right {
        margin-top: 5px;
        margin-right: 10px;
        background-color: rgba(0,0,0,0);
      }

      #custom-separator {
        color: ${blu};
      }

      #clock.time {
        color: ${blu};
      }

      #clock.calendar {
        color: ${blu};
      }

      #tray {
        border: ${border_width} solid ${blu};
        border-radius: 5px ;
        padding-left: 15px;
        padding-right: 15px;
      }

      #tray.needs-attention {
        background-color: alpha(${rd}, 0.7);
        border-radius: 15px;
      }

      #cpu {
        border: ${border_width} solid ${blu};
        border-radius: 5px;
        padding-left: 15px;
        padding-right: 15px;
        color: ${blu};
      }

      #cpu.low {
        color: ${blu};
      }

      #cpu.lower-medium {
        color: ${blu};
      }

      #cpu.medium {
        color: ${orng};
      }

      #cpu.upper-medium {
        color: ${orng2};
      }

      #cpu.high {
        color: ${rd};
      }

      #memory {
        border: ${border_width} solid ${blu};
        border-radius: 5px;
        padding-left: 15px;
        padding-right: 15px;
        color: ${blu};
      }

      #memory.low {
        color: ${blu};
      }

      #memory.lower-medium {
        color: ${blu};
      }

      #memory.medium {
        color: ${orng};
      }

      #memory.upper-medium {
        color: ${orng2};
      }

      #memory.high {
        color: ${rd};
      }

      #disk {
        border: ${border_width} solid ${blu};
        border-radius: 5px;
        padding-left: 15px;
        padding-right: 15px;
        color: ${blu};
      }

      #disk.low {
        color: ${blu};
      }

      #disk.lower-medium {
        color: ${blu};
      }

      #disk.medium {
        color: ${orng}
      }

      #disk.upper-medium {
        color: ${orng2};
      }

      #disk.high {
        color: ${rd};
      }

      #battery {
        border: ${border_width} solid ${blu};
        border-radius: 5px;
        padding-left: 15px;
        padding-right: 15px;
        color: ${blu};
      }

      #battery.low {
        color: ${rd};
      }

      #battery.lower-medium {
        color: ${orng2};
      }

      #battery.medium {
        color: ${orng};
      }

      #battery.upper-medium {
        color: ${blu};
      }

      #battery.high {
        color: ${blu};
      }

      #pulseaudio {
        border: ${border_width} solid ${blu};
        border-radius: 5px;
        padding-left: 15px;
        padding-right: 15px;
        color: ${blu};
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
