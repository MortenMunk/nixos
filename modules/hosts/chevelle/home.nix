{
  self,
  inputs,
  ...
}: {
  flake.homeModules.chevelleHome = {
    pkgs,
    config,
    ...
  }: {
    home.username = "morten";
    home.homeDirectory = "/home/morten";
    home.stateVersion = "25.05";

    imports = with self.homeModules; [
      myCli
      myDev
      myApps
      myDesktop
    ];

    nixpkgs.config.allowUnfree = true;

    myNiri = {
      dualMonitor.enable = true;
      screenshotKey = "Mod+S";
    };
  };
}
