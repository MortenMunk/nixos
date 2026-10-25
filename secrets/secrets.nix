let
  impala = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNhBUxTisNwclDJ+Ds1lPAIiLNTJied7O/JAQo5Wobk";
  chevelle = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMpiAUjJmWeU6SsR8AdRnAXyQqPca0Otbf9tlkgTPpPJ";
  nomad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdma6tB13IiMrThaEUAc+zSi8ff8NaG2KKcPvGuGKS4 root@nixos";
in {
  "github-impala.age".publicKeys = [impala];
  "github-chevelle.age".publicKeys = [chevelle];
  "wireguard.age".publicKeys = [chevelle nomad];
  "zfs.age".publicKeys = [chevelle nomad];
}
