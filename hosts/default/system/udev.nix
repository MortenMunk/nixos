{pkgs, ...}: {
  services.udev = {
    packages = with pkgs; [
      stlink
      openocd
    ];
  };
}
