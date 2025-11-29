{pkgs, ...}: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  imports = [
    ./modules/wm/default.nix
    ./modules/browser/brave.nix
    ./modules/terminal/default.nix
    ./modules/style/fonts.nix
    ./modules/system/default.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
