{self, ...}: {
  flake.nixosModules.myWayland = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options.my.wayland.nvidia.enable = lib.mkEnableOption "NVIDIA specific wayland settings";
    config = {
      programs.xwayland.enable = true;

      environment.systemPackages = with pkgs; [
        xwayland-satellite
      ];

      xdg.portal.enable = true;
      xdg.portal.extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      hardware.nvidia = lib.mkIf config.my.wayland.nvidia.enable {
        open = true;
        powerManagement.enable = true;
        modesetting.enable = true;
      };

      services.xserver.videoDrivers = lib.mkIf config.my.wayland.nvidia.enable ["nvidia"];
    };
  };
}
