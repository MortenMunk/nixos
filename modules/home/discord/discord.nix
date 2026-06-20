_: {
  flake.homeModules.myDiscord = {
    config,
    pkgs,
    lib,
    ...
  }: let
    cfg = config.programs.custom_discord;

    discordPatcherBin = pkgs.writers.writePython3Bin "discord-krisp-patcher" {
      libraries = with pkgs.python3Packages; [pyelftools capstone];
      flakeIgnore = ["E265" "E501" "F403" "F405"];
    } (builtins.readFile ./discord-patcher.py);

    wrapDiscordBinary = pkgs.writeShellScriptBin "discord" ''
      ${pkgs.findutils}/bin/find -L $HOME/.config/discord -name 'discord_krisp.node' -exec ${discordPatcherBin}/bin/discord-krisp-patcher {} +
      ${pkgs.discord}/bin/discord "$@"
    '';
  in {
    options.programs.custom_discord = {
      enable = lib.mkEnableOption "Custom Discord with Krisp Patcher";
      wrapDiscord = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Wrap the Discord binary to patch Krisp on startup";
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages =
        [discordPatcherBin]
        ++ (
          if cfg.wrapDiscord
          then [wrapDiscordBinary]
          else [pkgs.discord]
        );

      xdg.desktopEntries.discord = {
        name = "Discord";
        exec = "discord %U";
        icon = "discord";
        comment = "Chat with communities";
        categories = ["Network" "Chat"];
        terminal = false;
      };
    };
  };
}
