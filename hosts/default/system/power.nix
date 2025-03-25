{...}: {
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  # Kill out of memory processes
  services = {
    # auto-cpufreq.enable = true;
    earlyoom = {
      enable = true;
      enableNotifications = true;
      freeMemThreshold = 4;
    };
  };
}
