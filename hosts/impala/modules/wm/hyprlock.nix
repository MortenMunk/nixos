{...}: let
  blu = "rgb(131, 165, 152)";
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 1;
      };

      label = [
        {
          # WEEK
          text = ''cmd[update:18000000] echo "Week $(date +'%V')"'';
          font_size = 24;
          position = "0, -100";
          halign = "center";
          valign = "top";
          color = "${blu}";
        }
        {
          # DAY - MONTH - YEAR
          text = ''cmd[update:18000000] echo "$(date +'%-d %B %Y')"'';
          font = 38;
          position = "0, -150";
          halign = "center";
          valign = "top";
          color = "${blu}";
        }
        {
          # TIME
          text = ''cmd[update:1000] echo "$(date +'%H:%M:%S')"'';
          font_size = 80;
          position = "0, 100";
          halign = "center";
          valign = "bottom";
          color = "${blu}";
        }
      ];
    };
  };
}
