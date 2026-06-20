{inputs, ...}: {
  flake.homeModules.myDev = {pkgs, ...}: {
    home = {
      packages = with pkgs; [
        deadnix
        statix
        inputs.nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      file.".ssh/allowed_signers".text = ''
        * ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINulh/fd4ld2kGTKlJ0iPkMtW5O00/1MOBuaGiGmO1as
      '';

      file.".ssh/id_ed25519_github.pub".text = ''
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINulh/fd4ld2kGTKlJ0iPkMtW5O00/1MOBuaGiGmO1as
      '';
    };

    services.ssh-agent.enable = true;

    programs = {
      git = {
        enable = true;
        signing.format = "ssh";
        settings = {
          user = {
            name = "Morten Munk";
            email = "mortenmunk97@gmail.com";
          };
          commit.gpgsign = true;
          gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
          user.signingkey = "~/.ssh/id_ed25519_github.pub";
        };
      };

      lazygit = {
        enable = true;
        settings = {
          promptToReturnFromSubprocess = false;
          gui = {
            border = "single";
            mouseEvents = false;
            showBottomLine = false;
            mainPanelSplitMode = "horizontal";
          };
        };
      };

      ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = {
          "github.com" = {
            addKeysToAgent = "yes";
            identityFile = "~/.ssh/github_private_key";
            identitiesOnly = true;
          };
        };
      };

      vscodium = {
        enable = true;
        profiles.default = {
          enableUpdateCheck = false;
          enableExtensionUpdateCheck = false;
        };
      };
    };

    stylix.targets.vscode.profileNames = [
      "default"
    ];
  };
}
