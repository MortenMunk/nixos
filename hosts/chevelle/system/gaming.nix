{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    heroic
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;
}
