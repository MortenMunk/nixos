{pkgs, ...}: {
  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  hardware = {
    graphics.enable = true;
    nvidia.open = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
}
