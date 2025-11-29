{...}: {
  imports = [./keybinds.nix];

  programs.niri.settings = {
    input.keyboard.xkb.layout = "dk";
  };
}
