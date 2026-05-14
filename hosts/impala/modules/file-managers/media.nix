{pkgs, ...}: {
  home.packages = with pkgs; [
    unzip
    nautilus
  ];

  programs = {
    zathura.enable = true;
    imv.enable = true;
    mpv.enable = true;
  };
}
