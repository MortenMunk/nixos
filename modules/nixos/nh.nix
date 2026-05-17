{self, ...}: {
  flake.nixosModules.myNh = {...}: {
    programs.nh = {
      enable = true;
      flake = "/etc/nixos";
    };
  };
}
