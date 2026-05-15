{...}: {
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };
}
