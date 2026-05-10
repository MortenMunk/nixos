{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wineWow64Packages.staging
    winetricks
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;
}
