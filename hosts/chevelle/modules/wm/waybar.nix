{config, ...}: let
  stylix = config.lib.stylix.colors.withHashtag;
in {
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";

      modules-left = ["clock" "tray"];
      modules-center = ["niri/workspaces"];
      modules-right = ["network" "cpu" "memory" "temperature" "disk" "custom/nixos"];

      "niri/workspaces" = {
        format = "●";
        on-click = "activate";
      };

      "custom/nixos" = {
        format = " 󱄅 ";
        on-click = "wlogout";
        tooltip = false;
      };

      clock = {
        format = "{:%H:%M:%S} ";
        interval = 1;
        tooltip-format = "<tt>{calendar}</tt>";
        calendar.format.today = "<span color='#fAfBfC'><b>{}</b></span>";
        actions = {
          on-click-right = "shift_down";
          on-click = "shift_up";
        };
      };

      network = {
        format = "󰈁";
        format-disconnected = "󰈁";
        format-ethernet = "󰈁";
        tooltip-format-ethernet = "{ifname}";
        on-click = "nmtui";
      };

      cpu = {
        format = "󰍛";
        on-click = "btop";
      };
      memory = {
        format = "";
        on-click = "btop";
      };

      temperature = {
        critical-threshold = 80;
        format = "";
      };

      disk = {
        format = "";
        on-click = "btop";
      };

      tray = {
        icon-size = 14;
        spacing = 10;
      };
    };

    style = ''
      * {
        font-size:15px;
        font-family: "CodeNewRoman Nerd Font Propo";
      }

      window#waybar {
        all:unset;
      }

      .modules-left {
        padding: 7px;
        margin: 10px 0px 5px 10px;
        border-radius: 10px;
        background: alpha(${stylix.base00},.7);
        box-shadow: 0px 0px 2px rgba(0,0,0,.7);
      }

      .modules-center {
        padding:7px;
        margin:10px 0px 5px 0px;
        border-radius: 10px;
        background: alpha(${stylix.base00},.7);
        box-shadow: 0px 0px 2px rgba(0,0,0,.7);
      }

      .modules-right {
        padding: 7px;
        margin: 10px 10px 5px 0px;
        border-radius: 10px;
        background: alpha(${stylix.base00},.7);
        box-shadow: 0px 0px 2px rgba(0,0,0,.7);
      }

      tooltop {
        background: ${stylix.base00};
        color: ${stylix.base07};
      }

      #clock:hover, #network.hover, #cpu.hover, #temperature.hover, #disk.hover {
        transition: all .3s ease;
        color:  ${stylix.base09};
      }

      #clock {
        padding: 0px 5px;
        color: ${stylix.base07};
      }

      #workspaces {
        padding: 0px 5px;
      }

      #workspaces button {
        all:unset;
        padding: 0px 5px;
        color: alpha(${stylix.base09},.4);
        transition: all .2s ease;
      }

      #workspaces button:hover {
        color:rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0,0,0, .5);
        transition: all 1s ease;
      }

      #workspaces button.active {
        color: ${stylix.base09};
        border: none;
        text-shadow: 0px 0px 2px rgba(0,0,0,.5);
      }

      #workspaces button.empty {
        color: rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0,0,0,.2);
      }

      #workspaces button.empty:hover {
        color: rgba(0,0,0,0);
        border:none;
        text-shadow: 0px 0px 1.5px rgba(0,0,0,.5);
        transition: all 1s ease;
      }

      #workspaces button.empty.active {
        color: ${stylix.base09};
        border: none;
        text-shadow: 0px 0px 2px rgba(0,0,0,.5);
      }

      #cpu,#memory,#temperature,#disk,#network{
        padding: 0px 10px;
        transition: all .3s ease;
        color: ${stylix.base07};
      }

      #custom-nixos {
        padding: 0px 10px;
        font-size: 25px;
        color: #B2C9EB;
      }

      #tray{
        padding: 0px 5px;
        transition: all .3s ease;

      }
      #tray menu * {
        padding: 0px 5px;
        transition: all .3s ease;
      }

      #tray menu separator {
        padding: 0px 5px;
        transition: all .3s ease;
      }

    '';
  };
}
