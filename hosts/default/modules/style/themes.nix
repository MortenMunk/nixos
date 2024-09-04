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

	gtk.catppuccin = {
		enable = true;
		flavor = "macchiato";
	};

	qt.style.catppuccin = {
		enable = true;
		flavor = "macchiato";
	};
}
