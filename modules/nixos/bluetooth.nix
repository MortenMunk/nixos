{self, ...}: {
  flake.nixosModules.myBluetooth = {...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    services.blueman.enable = true;
  };
}
