{self, ...}: {
  flake.homeModules.myDesktop = {pkgs, ...}: {
    imports = with self.homeModules; [
      myNiri
      myNiriKeybinds
      myVicinae
    ];

    programs.swaylock.enable = true;
    home.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nautilus
    ];

    fonts.fontconfig.enable = true;
    services = {
      polkit-gnome.enable = true;
      swayidle.enable = true;
    };
  };
}
