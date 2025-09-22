{...}: {
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
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
