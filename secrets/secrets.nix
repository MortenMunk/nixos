let
  impala = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNhBUxTisNwclDJ+Ds1lPAIiLNTJied7O/JAQo5Wobk";
  chevelle = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMpiAUjJmWeU6SsR8AdRnAXyQqPca0Otbf9tlkgTPpPJ";
in {
  "github-impala.age".publicKeys = [impala];
  "github-chevelle.age".publicKeys = [chevelle];
}
