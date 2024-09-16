{pkgs, ...}: {
    home.packages = with pkgs; [
        hypridle
    ];

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
                # Reduce brightness after n seconds
                {
                    timeout = 180;
                    on-timeout = "brightnessctl -s set 10";
                    on-resume = "brightnessctl -r";
                }
                # Turn off keyboard light after n seconds
                {
                    timeout = 180;
                    on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
                    on-resume = "brightnessctl -rd rgb:kbd_backlight";
                }
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