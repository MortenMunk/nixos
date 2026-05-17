{
  self,
  inputs,
  ...
}: {
  flake.homeModules.impalaHome = {pkgs, ...}: {
    home.username = "morten";
    home.homeDirectory = "/home/morten";
    home.stateVersion = "24.05";

    imports = with self.homeModules; [
      myCli
    ];
  };
}
