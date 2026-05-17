{self, ...}: {
  flake.nixosModules.chevelleSecrets = {...}: {
    age = {
      identityPaths = ["/home/morten/.ssh/id_ed25519"];
      secrets."github-chevelle" = {
        file = self.ageFiles.github-chevelle;
        path = "/home/morten/.ssh/github_private_key";
        owner = "morten";
        mode = "600";
      };
      work-vpn-impala = {
        file = self.ageFiles.work-vpn;
        path = "/etc/wireguard/wg1.conf";
        owner = "morten";
        mode = "600";
      };
    };
  };
}
