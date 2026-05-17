{
  self,
  inputs,
  ...
}: {
  flake.homeModules.chevelleHome = {pkgs, ...}: {
    home.username = "morten";
    home.homeDirectory = "/home/morten";
    home.stateVersion = "25.05";

    #imports = with self.homeModules; [];

    #home.packages = with pkgs; [];
  };
}
