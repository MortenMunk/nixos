{...}: let
  base = "#282828";
  surface = "#504945";
  surface1 = "#665c54";
  subtext = "#d5c4a1";
  text = "#fbf1c7";
  rd = "#fb4934";
  orng = "#fe8019";
  yllw = "#fabd2f";
  grn = "#b8bb26";
  grn2 = "#8ec07c";
  blu = "#83a598";
  pnk = "#d3869b";
  orng2 = "#d65d0e";
in {
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
      }

      window#waybar {
        background-color: alpha(${base}, 0.7);
        border-bottom: solid alpha(${surface}, 0.7) 2px;
      }

      #user {
        padding-left: 10px;
      }

      #language {
        padding-left: 15px;
      }

      #keyboard-state label.locked {
        color: ${yllw};
      }

      #keyboard-state label {
        color: ${subtext};
      }

      #custom-os_button {
        color: ${blu};
        font-size: 24px;
        padding-left: 12px;
        padding-right: 12px;
      }

      #workspaces button.active {
        color: ${orng};
      }

      #workspaces button {
        color: ${text};
      }

      #submap {
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-left: 20px;
        margin-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      .modules-center {
        font-weight: bold;
        background-color: alpha(${surface1}, 0.7);
        color: ${orng};
        border-radius: 15px;
        padding-left: 20px;
        padding-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      .modules-right {
        margin-right: 5px;
      }

      #custom-separator {
        color: ${grn};
      }

      #custom-separator_dot {
        color: ${grn};
      }

      #clock.time {
        color: ${pnk};
      }

      #clock.week {
        color: ${grn2};
      }

      #clock.month {
        color: ${grn2};
      }

      #clock.calendar {
        color: ${orng2};
      }

      #tray {
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #tray.needs-attention {
        background-color: alpha(${rd}, 0.7);
        border-radius: 15px;
      }

      #cpu {
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: ${grn};
      }

      #cpu.low {
        color: ${grn2};
      }

      #cpu.lower-medium {
        color: ${yllw};
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
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: ${grn};
      }

      #memory.low {
        color: ${grn2};
      }

      #memory.lower-medium {
        color: ${yllw};
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
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: ${grn};
      }

      #disk.low {
        color: ${grn2};
      }

      #disk.lower-medium {
        color: ${yllw};
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
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: ${grn};
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
        color: ${yllw};
      }

      #battery.high {
        color: ${grn};
      }

      #pulseaudio {
        background-color: alpha(${surface1}, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: ${blu};
      }
    '';

    settings = {
      top_bar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;
        modules-left = [
          "custom/os_button"
          "hyprland/workspaces"
          "hyprland/submap"
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

        "hyprland/submap" = {
          format = "<span color='#a6da95'>Mode:</span> {}";
          tooltip = false;
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
              months = "<span color='#f4dbd6'><b>{}</b></span>";
              days = "<span color='#cad3f5'><b>{}</b></span>";
              weeks = "<span color='#c6a0f6'><b>W{}</b></span>";
              weekdays = "<span color='#a6da95'><b>{}</b></span>";
              today = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
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
              months = "<span color='#f4dbd6'><b>{}</b></span>";
              days = "<span color='#cad3f5'><b>{}</b></span>";
              weeks = "<span color='#c6a0f6'><b>W{}</b></span>";
              weekdays = "<span color='#a6da95'><b>{}</b></span>";
              today = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
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
