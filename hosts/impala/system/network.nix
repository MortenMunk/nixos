{...}: {
  networking = {
    networkmanager.enable = true;
    wg-quick.interfaces = {
      wg1 = {
        configFile = "/etc/wireguard/wg1.conf";
        autostart = false;
      };
    };
  };
}
