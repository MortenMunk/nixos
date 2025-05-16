{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -r --remember-session --cmd 'uwsm start hyprland-uwsm.desktop'";
      user = "greeter";
    };
  };
}
