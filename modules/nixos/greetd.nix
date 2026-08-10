_: {
  flake.nixosModules.myGreetd = {
    pkgs,
    config,
    ...
  }: {
    programs.niri.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -t -r --asterisks --remember-session --cmd ${config.programs.niri.package}/bin/niri-session";
        user = "greeter";
      };
    };
  };
}
