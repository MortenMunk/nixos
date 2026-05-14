{...}: {
  programs.niri.settings.window-rules = [
    {
      geometry-corner-radius = {
        bottom-left = 6.0;
        bottom-right = 6.0;
        top-left = 6.0;
        top-right = 6.0;
      };
      clip-to-geometry = true;
    }
    {
      matches = [{app-id = "^kitty$";}];
      opacity = 0.95;
    }
  ];
}
