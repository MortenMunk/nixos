{self, ...}: {
  flake.nixosModules.impalaSecrets = _: {
    age = {
      identityPaths = ["/home/morten/.ssh/id_ed25519"];
      secrets = {
        github-impala = {
          file = self.ageFiles.github-impala;
          path = "/home/morten/.ssh/github_private_key";
          owner = "morten";
          mode = "600";
        };
      };
    };
  };
}
