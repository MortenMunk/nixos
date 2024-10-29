{...}: {
  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
      }

      window#waybar {
        background-color: alpha(@base, 0.7);
        border-bottom: solid alpha(@surface1, 0.7) 2px;
      }

      #user {
        padding-left: 10px;
      }

      #language {
        padding-left: 15px;
      }

      #keyboard-state label.locked {
        color: @yellow;
      }

      #keyboard-state label {
        color: @subtext0;
      }

      #custom-os_button {
        color: @sky;
        font-size: 24px;
        padding-left: 12px;
        padding-right: 12px;
      }

      #workspaces button.active {
        color: @peach;
      }

      #workspaces button {
        color: @text;
      }

      #submap {
        background-color: alpha(@surface1, 0.7);
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
        background-color: alpha(@surface1, 0.7);
        color: @peach;
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
        color: @green;
      }

      #custom-separator_dot {
        color: @green;
      }

      #clock.time {
        color: @flamingo;
      }

      #clock.week {
        color: @sapphire;
      }

      #clock.month {
        color: @sapphire;
      }

      #clock.calendar {
        color: @mauve;
      }

      #tray {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #tray.needs-attention {
        background-color: alpha(@maroon, 0.7);
        border-radius: 15px;
      }

      #cpu {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: @sapphire;
      }

      #cpu.low {
        color: @rosewater;
      }

      #cpu.lower-medium {
        color: @yellow;
      }

      #cpu.medium {
        color: @peach;
      }

      #cpu.upper-medium {
        color: @maroon;
      }

      #cpu.high {
        color: @red;
      }

      #memory {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: @sapphire;
      }

      #memory.low {
        color: @rosewater;
      }

      #memory.lower-medium {
        color: @yellow;
      }

      #memory.medium {
        color: @peach;
      }

      #memory.upper-medium {
        color: @maroon;
      }

      #memory.high {
        color: @red;
      }

      #disk {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: @sapphire;
      }

      #disk.low {
        color: @rosewater;
      }

      #disk.lower-medium {
        color: @yellow;
      }

      #disk.medium {
        color: @peach;
      }

      #disk.upper-medium {
        color: @maroon;
      }

      #disk.high {
        color: @red;
      }

      #battery {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: @teal;
      }

      #battery.low {
        color: @red;
      }

      #battery.lower-medium {
        color: @maroon;
      }

      #battery.medium {
        color: @peach;
      }

      #battery.upper-medium {
        color: @flamingo;
      }

      #battery.high {
        color: @rosewater;
      }

      #pulseaudio {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 5px;
        margin-bottom: 5px;
        color: @sapphire;
      }
    '';

    catppuccin = {
      enable = true;
      flavor = "macchiato";
      mode = "prependImport";
    };

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
            "pulseaudio#audio" 
            "pulseaudio#mic" 
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

        "pulseaudio#audio" = {
          tooltip-format = "{desc}\n{format_source}";
          format = "{icon}";
          format-muted = "󰝟";
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

        "pulseaudio#mic" = {
          format = "{format_source}";
          format-source-muted = "󰍭";
          format-source =  "󰍬";
          tooltip-format = "{desc}\n{format_source}";
	        on-click = "kitty pwvucontrol";
        };
      };
    };
  };
}
