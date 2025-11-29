{pkgs, ...}: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
