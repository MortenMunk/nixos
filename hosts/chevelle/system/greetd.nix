{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet -t -r --remember-session --asterisks --cmd 'niri-session'";
      user = "greeter";
    };
  };
}
