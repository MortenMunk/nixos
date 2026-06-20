{self, ...}: {
  flake.homeModules.myApps = {pkgs, ...}: {
    imports = [
      self.homeModules.myDiscord
    ];

    home.packages = with pkgs; [
      teams-for-linux
      obsidian
      libreoffice
      brave
      proton-vpn
    ];

    programs = {
      zathura.enable = true;
      imv.enable = true;
      mpv.enable = true;

      custom_discord = {
        enable = true;
        wrapDiscord = true;
      };
    };
  };
}
