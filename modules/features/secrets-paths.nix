{self, ...}: {
  flake.ageFiles = {
    github-chevelle = self + "/secrets/github-chevelle.age";
    github-impala = self + "/secrets/github-impala.age";
  };
}
