{
  programs.niri.settings = {
    binds = {
      "Super+Q".spawn = ["kitty"];
      "Super+C".action = "close-window";
      "Super+R".spawn = ["rofi" "-show" "drun"];
    };
  };
}
