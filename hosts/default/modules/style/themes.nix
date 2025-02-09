{pkgs, ...}: {
  home.packages = with pkgs; [
    numix-icon-theme-circle
    catppuccin-kvantum
    catppuccin-sddm
    catppuccin
    catppuccin-cursors.macchiatoTeal
    catppuccin-qt5ct
    catppuccin-gtk
  ];

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.catppuccin-cursors.macchiatoTeal;
    cursorTheme.name = "catppuccin-macchiato-teal-cursors";
    cursorTheme.size = 18;
  };

  catppuccin.hyprland = {
    enable = true;
    flavor = "macchiato";
    accent = "mauve";
  };

  home.pointerCursor = {
    name = "catppuccin-macchiato-teal-cursors";
    package = pkgs.catppuccin-cursors.macchiatoTeal;
    size = 32;
    x11.enable = true;
    gtk.enable = true;
  };

  catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
}
