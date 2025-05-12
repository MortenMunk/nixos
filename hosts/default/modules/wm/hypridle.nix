{...}: {
  services.hypridle = {
    enable = true;
    settings = {
      # Lock when suspend
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        # Lock screen after n seconds
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        # Turn monitor off n seconds
        {
          timeout = 350;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        #  complete suspend after n seconds
        {
          timeout = 420;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
