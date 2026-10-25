{self, ...}: {
  flake.ageFiles = {
    github-chevelle = self + "/secrets/github-chevelle.age";
    github-impala = self + "/secrets/github-impala.age";
    wireguard-server = self + "/secrets/wireguard.age";
    zfs-key = self + "/secrets/zfs.age";
  };
}
