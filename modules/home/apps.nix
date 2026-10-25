{self, ...}: {
  flake.homeModules.myApps = {pkgs, ...}: {
    imports = [
      self.homeModules.myDiscord
    ];

    home.packages = with pkgs; [
      libreoffice
      brave
      proton-vpn
      element
      element-web
    ];

    programs = {
      zathura.enable = true;
      imv.enable = true;
      mpv.enable = true;

      custom_discord = {
        enable = true;
      };
    };
  };
}
