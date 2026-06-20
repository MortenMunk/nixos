{self, ...}: {
  flake.homeModules.chevelleHome = {...}: {
    home = {
      username = "morten";
      homeDirectory = "/home/morten";
      stateVersion = "25.05";
    };

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
