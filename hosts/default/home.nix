{pkgs, ...}: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./modules/file-managers/media.nix
    ./modules/text-editor/default.nix
    ./modules/style/fonts.nix
    ./modules/wm/default.nix
    ./modules/system/default.nix
    ./modules/terminal/default.nix
    ./modules/browser/brave.nix
    ./modules/browser/librewolf.nix
    ./modules/other/default.nix
  ];

  home.packages = with pkgs; [
    nautilus
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    MOZ_ENABLE_WAYLAND = "1";
    ROFI_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XCURSOR_SIZE = "18";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
