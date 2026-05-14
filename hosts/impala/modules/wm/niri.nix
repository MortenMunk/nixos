{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./rules.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
    swaybg
  ];

  programs.niri.settings = {
    environment."NIXOS_OZONE_WL" = "1";

    input.keyboard.xkb.layout = "dk";

    spawn-at-startup = [
      {argv = ["swaybg" "-i" "/etc/nixos/wallpapers/bg.png"];}
      {command = ["noctalia-shell"];}
    ];

    prefer-no-csd = true;

    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite;
    };

    hotkey-overlay.skip-at-startup = true;

    layout.gaps = 8;
  };
}
