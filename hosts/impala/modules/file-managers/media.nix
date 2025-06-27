{pkgs, ...}: {
  home.packages = with pkgs; [
    unzip
  ];

  programs = {
    zathura.enable = true;
    imv.enable = true;
    mpv.enable = true;
  };
}
