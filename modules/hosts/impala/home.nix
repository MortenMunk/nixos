{self, ...}: {
  flake.homeModules.impalaHome = {...}: {
    home = {
      username = "morten";
      homeDirectory = "/home/morten";
      stateVersion = "24.05";
    };

    imports = with self.homeModules; [
      myCli
      myDev
      myApps
      myDesktop
    ];

    nixpkgs.config.allowUnfree = true;

    myNoctalia.laptop.enable = true;
  };
}
