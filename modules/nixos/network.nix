{self, ...}: {
  flake.nixosModules.myNetwork = {config, ...}: {
    networking = {
      networkmanager.enable = true;
      wg-quick.interfaces = {
        wg1 = {
          configFile = config.age.secrets."wg1-conf".path;
          autostart = false;
        };
      };
    };
  };
}
