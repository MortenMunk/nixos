{self, ...}: {
  flake.nixosModules.myNetwork = {config, ...}: {
    networking = {
      networkmanager.enable = true;
      #wg-quick.interfaces = {
      #  wg1 = {
      #    configFile = config.age.secrets.work-vpn.path;
      #    autostart = false;
      #  };
      #};
    };
  };
}
