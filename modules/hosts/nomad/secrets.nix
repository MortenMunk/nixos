{self, ...}: {
  flake.nixosModules.nomadSecrets = _: {
    age = {
      secrets = {
        wireguard = {
          file = self.ageFiles.wireguard-server;
        };
        zfs = {
          file = self.ageFiles.zfs-key;
        };
      };
    };
  };
}
