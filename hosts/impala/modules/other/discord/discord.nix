{
  home.file.".local/share/applications/discord.desktop".text = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Discord
    Comment=Chat with communities
    Exec=discord %U
    Icon=discord
    Terminal=false
    Categories=Network;Chat;
  '';

  imports = [
    ./patcher.nix
  ];

  programs.discord = {
    enable = true;
    wrapDiscord = true;
  };
}
