{
  self,
  inputs,
  ...
}: {
  flake.homeModules.impalaHome = {
    pkgs,
    config,
    ...
  }: {
    home.username = "morten";
    home.homeDirectory = "/home/morten";
    home.stateVersion = "24.05";

    imports = with self.homeModules; [
      myCli
      myDev
      myApps
      myDesktop
    ];

    nixpkgs.config.allowUnfree = true;

    # Silence stupid error
    gtk.gtk4.theme = null;
  };
}
