{pkgs, ...}: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  imports = [
    ./modules/file-manager/media.nix
    ./modules/wm/niri.nix
    ./modules/browser/brave.nix
    ./modules/terminal/default.nix
    ./modules/style/fonts.nix
    ./modules/text-editor/default.nix
    ./modules/system/default.nix
    ./modules/other/default.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
