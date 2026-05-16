{pkgs, ...}: {
  home.packages = with pkgs; [
    unzip
    nautilus
    tree
  ];

  programs = {
    zathura.enable = true;
    imv.enable = true;
    mpv.enable = true;
  };
}
