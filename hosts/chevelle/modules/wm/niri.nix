{...}: {
  imports = [
    ./keybinds.nix
    ./waybar.nix
  ];

  programs.niri.settings = {
    input.keyboard.xkb.layout = "dk";
  };
}
