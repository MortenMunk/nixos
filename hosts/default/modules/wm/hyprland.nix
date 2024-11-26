{pkgs, ...}: 
let 
	startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
	${pkgs.waybar}/bin/waybar &
	${pkgs.hypridle}/bin/hypridle &
	${pkgs.hyprpaper}/bin/hyprpaper &
	wl-paste --type text --watch cliphist store &
	wl-paste --type image --watch cliphist store &
	nm-applet --indicator &
	'';
in
{  
    wayland.windowManager.hyprland = {
		enable = true;
		extraConfig = ''
			bind = , Print, exec, grim -g "$(slurp)" - | wl-copy | dunstify "Screenshot of the region copied" -t 1000 # screenshot of a region 
 			bind = SUPER, Print, exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen saved" -t 1000 # screenshot of the whole screen
 		'';
		settings = {
			exec-once = ''${startupScript}/bin/start'';

			# MONITOR
      monitor = [
        ", preferred, auto, 1.2"
        "HDMI-A-1,preferred,auto, 1, mirror, eDP-1"
      ];
			
			xwayland = {
				force_zero_scaling = true;
			};

			# KEYBOARD AND TOUCHPAD
			input = {
				kb_layout = "dk";
				follow_mouse = 1;
				touchpad = {
					tap-and-drag = true;
					natural_scroll = true;
				};
				sensitivity = 0;
			};

			

			# GENERAL
			general = {		
				gaps_in = 5;
				gaps_out = 10;
				border_size = 2;
				"col.active_border" = "rgb(268bd2)"; # rgb(6272a4) or rgb(44475a)
				"col.inactive_border" = "rgb(1a1a1a)";
				layout = "dwindle";
			};

			# DECORATION
			decoration = {
				rounding = 10;
				active_opacity = 0.7;
				inactive_opacity = 0.7;
				fullscreen_opacity = 0.7;
				blur = {
					enabled = true;
					size = 8;
					passes = 2;
					new_optimizations = true;
				};
        shadow = {
          enabled = true;
          range = 15;
          ignore_window = true;
          color = "rgba(1E202966)";
          render_power = 3;
        }; 
			};
			
			# ANIMATIONS
			animations = {
				enabled = true;
				bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [
					"windows, 1, 2, myBezier"
					"windowsOut, 1, 2, default, popin 80%"
					"border, 1, 3, default"
					"fade, 1, 2, default"
					"workspaces, 1, 1, default"
				];
			};

			# GESTURES
			gestures = {
				workspace_swipe = true;
			};

			# MASTER
			master = {
				new_status = "master";
			};

			# DWINDLE
			dwindle = {
				pseudotile = true;
				preserve_split = true;
				smart_split = true;
			};

			# BINDS
			"$mod" = "SUPER";
			
			bind = [
				# PROGRAM BINDS	
				"$mod, Q, exec, kitty"
				"$mod, C, killactive"
				"$mod, M, exit"
				"$mod, E, exec, nautilus"
				#"$mod, V, togglefloating"
				"$mod, R, exec, rofi -show drun -show-icons"
				"$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
				"$mod, P, pseudo, #dwindle"
				"$mod, J, togglesplit, #dwindle"
				
				# HYPRSHOT


				# MOVEFOCUS
				"$mod, left, movefocus, l"
				"$mod, right, movefocus, r"
				"$mod, up, movefocus, u"
				"$mod, down, movefocus, d"

				# WORKSPACE
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 10"

				# ACTIVE WORKSPACE
				"$mod SHIFT, 1, movetoworkspace, 1"
				"$mod SHIFT, 2, movetoworkspace, 2"
				"$mod SHIFT, 3, movetoworkspace, 3"
				"$mod SHIFT, 4, movetoworkspace, 4"
				"$mod SHIFT, 5, movetoworkspace, 5"
				"$mod SHIFT, 6, movetoworkspace, 6"
				"$mod SHIFT, 7, movetoworkspace, 7"
				"$mod SHIFT, 8, movetoworkspace, 8"
				"$mod SHIFT, 9, movetoworkspace, 9"
				"$mod SHIFT, 0, movetoworkspace, 10"

				# SPECIAL WORKSPACE
				"$mod, S, togglespecialworkspace, magic"
				#"$mod SHIFT, S movetoworkspace, special:magic"

				# SCROLL WORKSPACES
				"$mod, mouse_down, workspace, e+1"
				"$mod, mouse_up, workspace, e-1"
			];

			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
			
      windowrule = [
				"opaque, brave"
				"opaque, zathura"
				"opaque, vesktop"
			];
		};
	};
}
