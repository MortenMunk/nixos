{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ../../wallpapers/bg1.jpg;
    polarity = "dark";
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 32;
    };
    iconTheme = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      light = "Gruvbox-Plus-Light";
      dark = "Gruvbox-Plus-Dark";
    };
    enableReleaseChecks = false;
    targets.grub.enable = false;
  };
}
