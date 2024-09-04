{pkgs, ...}: {
    home.packages = with pkgs; [
        hyprlock
    ];

    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                grace = 1;
            };

            background = [
                {
                    # path = <link>
                    blur_size = 5;
                    blur_passes = 1;
                    noise = 0.0117;
                    contrast = 1.3000;
                    brightness = 0.8000;
                    vibrancy = 0.2100;
                    vibrancy_darkness = 0.0;
                }
            ];

            input-field = [
                {
                    size = "250, 50";
                    outline_thickness = 3;
                    dots_size = 0.33;
                    dots_spacing = 0.15;
                    dots_center = true;
                    outer_color = "rgb(139, 213, 202)"; # teal
                    inner_color = "rgb(245, 169, 127)"; # peach
                    font_color = "rgb(202, 211, 245)"; # text
                    placeholder_text = "<i>Password...<i>";
                    hide_input = false;
                    position = "0, 200";
                    halign = "center";
                    valign = "bottom";
                }                
            ];

            label = [
                {
                    text = "week";
                    color = "rgb(183, 189, 248)"; # lavender
                    font_size = 24;
                    font_family = "JetBrains Mono Nerd Font 10";
                    position = "0, -250";
                    halign = "center";
                    valign = "top";
                }
                {
                    text = "time";
                    color = "rgb(183, 189, 248)"; # lavender
                    font_size = 94;
                    font_family = "JetBrains Mono Nerd Font 10";
                    position = "0, 0";
                    halign = "center";
                    valign = "center";
                }
                {
                    text = "uptime";
                    color = "rgb(183, 189, 248)"; # lavender
                    font_size = 24;
                    font_family = "JetBrains Mono Nerd Font 10";
                    position = "0, 0";
                    halign = "right";
                    valign = "bottom";
                }
                {
                    text = "weather";
                    color = "rgb(183, 189, 248)"; # lavender
                    font_size = 24;
                    font_family = "JetBrains Mono Nerd Font 10";
                    position = "50, 0";
                    halign = "left";
                    valign = "bottom";
                }
            ];

            image = [
                {
                    # path = <link>
                    size = 230;
                    rounding = -1;
                    border_size = 2;
                    border_color = "rgb(238, 153, 160)"; # maroon
                    rotate = 0;
                    reload_time = -1;
                    position = "0, 300";
                    halign = "center";
                    valign = "bottom";
                }
            ];
        };
    };
}