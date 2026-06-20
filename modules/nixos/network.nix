_: {
  flake.nixosModules.myNetwork = _: {
    networking = {
      networkmanager.enable = true;
    };
  };
}
