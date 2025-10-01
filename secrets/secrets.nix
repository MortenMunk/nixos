let
  impala = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNhBUxTisNwclDJ+Ds1lPAIiLNTJied7O/JAQo5Wobk";
in {
  "github-impala.age".publicKeys = [impala];
  "ovpn_work.age".publicKeys = [impala];
}
