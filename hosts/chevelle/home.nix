{pkgs, ...}: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
