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
    };
  };
}
