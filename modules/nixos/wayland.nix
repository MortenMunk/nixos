_: {
  flake.nixosModules.myWayland = {
    lib,
    config,
    ...
  }: {
    options.my.wayland.nvidia.enable = lib.mkEnableOption "NVIDIA specific wayland settings";
    config = {
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
