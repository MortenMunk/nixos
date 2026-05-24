{
  self,
  inputs,
  ...
}: {
  flake.homeModules.myVicinae = {...}: {
    programs.vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
      };
      settings = {
        pop_to_root_on_close = true;
        close_on_focus_loss = true;
      };
    };
  };
}
