_: {
  flake.nixosModules.myNh = _: {
    programs.nh = {
      enable = true;
      flake = "/etc/nixos";
    };
  };
}
