{pkgs, ...}: {
  home.packages = with pkgs; [
    pwvucontrol
    pamixer
  ];
}

