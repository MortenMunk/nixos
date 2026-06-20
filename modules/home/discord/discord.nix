{...}: {
  flake.homeModules.myDiscord = {
    config,
    pkgs,
    lib,
    ...
  }: let
    cfg = config.programs.custom_discord;
    discordPatcher = pkgs.writers.writePython3 "discord-krisp-patcher" {
      libraries = with pkgs.python3Packages; [
        pyelftools
        capstone
      ];
      flakeIgnore = [
        "E265" # from nix-shell shebang
        "E501" # line too long
        "F403" # from module import * used
        "F405" # name may be undefined
      ];
    } (builtins.readFile ./discord-patcher.py);

    patchedDiscord = pkgs.discord.overrideAttrs (old: {
      postFixup = let
        stageMine = pkgs.writeShellScript "discord-stage-mine" ''
               set -eu
               store_modules="$1"
               modules_dir="''${XDG_CONFIG_HOME:-$HOME/.config}/discord/${old.version}/modules"

          # Mirror upstream's guard: only stage when not already installed.
               if [ -f "$modules_dir/installed.json" ]; then
                 exit 0
               fi

               mkdir -p "$modules_dir"
               for m in "$store_modules"/*; do
                 dest="$modules_dir/$(basename "$m")"

                 if [ -L "$dest" ]; then
                   rm "$dest"
                 fi

                 cp -RL "$m" "$dest"
               done

               chmod -R u+w "$modules_dir"

               # Write installed.json last, so a crash mid-copy doesn't mark us "done".
               echo '${
            builtins.toJSON (lib.mapAttrs (_: mod: {installedVersion = mod;}) old.passthru.moduleVersions)
          }' \
                 > "$modules_dir/installed.json"
        '';
      in
        (old.postFixup or "")
        + ''
          ${pkgs.findutils}/bin/find "$out/opt/Discord/modules" \
            -name 'discord_krisp.node' -exec ${discordPatcher} {} \;

          # Target Discord so that we can run BEFORE upstream `stageModules` runs.
          # We wrap the already wrapped discord, meaning we run first, populate
          # installed.json, and bypass the default upstream staging.
          wrapProgram "$out/opt/Discord/Discord" \
            --run "${stageMine} $out/opt/Discord/modules"
        '';
    });
  in {
    options.programs.custom_discord = {
      enable = lib.mkEnableOption "Custom Discord with Krisp Patcher";
    };

    config = lib.mkIf cfg.enable {
      home.packages = [patchedDiscord];

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
