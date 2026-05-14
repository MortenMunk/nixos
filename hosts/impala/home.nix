{pkgs, ...}: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./modules/file-managers/media.nix
    ./modules/text-editor/default.nix
    ./modules/style/fonts.nix
    ./modules/wm/niri.nix
    ./modules/system/default.nix
    ./modules/terminal/default.nix
    ./modules/browser/brave.nix
    ./modules/other/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  stylix.enableReleaseChecks = false;
}
