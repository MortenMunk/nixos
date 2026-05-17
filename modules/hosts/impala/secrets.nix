{self, ...}: {
  flake.nixosModules.chevelleSecrets = {...}: {
    age = {
      identityPaths = ["/home/morten/.ssh/id_ed25519"];
      secrets = {
        github-impala = {
          file = self.ageFiles.github-impala;
          path = "/home/morten/.ssh/github_private_key";
          owner = "morten";
          mode = "600";
        };
        work-vpn = {
          file = self.ageFiles.work-vpn;
          path = "/etc/wireguard/wg1.conf";
          owner = "morten";
          mode = "600";
        };
      };
    };
  };
}
