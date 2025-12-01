{...}: {
  imports = [
    ./keybinds.nix
    ./waybar.nix
    ./monitor.nix
    ./rules.nix
  ];

  programs.niri.settings = {
    environment."NIXOS_OZONE_WL" = "1";

    input.keyboard.xkb.layout = "dk";

    spawn-at-startup = [
      {argv = ["waybar"];}
    ];

    prefer-no-csd = true;
  };
}
