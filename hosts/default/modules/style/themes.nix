{pkgs, ...}: {

	home.packages = with pkgs; [
		numix-icon-theme-circle
		colloid-icon-theme
		catppuccin-gtk
		catppuccin-kvantum
		catppuccin-sddm
		catppuccin
		catppuccin-cursors.macchiatoTeal
		catppuccin-qt5ct
	];

  catppuccin.hyprland = {
    enable = true;
    flavor = "macchiato";
    accent = "mauve";
  };

	home.sessionVariables = {
		GTK_THEME = "catppuccin-frappe-blue-standard";
	};

	home.pointerCursor = {
		name = "catppuccin-macchiato-teal-cursors";
		package = pkgs.catppuccin-cursors.macchiatoTeal;
	};

	catppuccin = {
		enable = true;
		flavor = "macchiato";	
	};

	catppuccin.gtk = {
		enable = true;
		flavor = "macchiato";
	};

	catppuccin.kvantum = {
		enable = true;
		flavor = "macchiato";
	};
}
