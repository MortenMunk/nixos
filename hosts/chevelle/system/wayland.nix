{pkgs, ...}: {
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      powerManagement.enable = true;
    };
  };

  services.xserver.videoDrivers = ["nvidia"];
}
