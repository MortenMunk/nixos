{
  home.file."./ssh/allowed_signers".text = ''
    * ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHoxV/uzpDWKBHPlzVqAsJNpkuSyOUlXLGMxldQ563O/ mortenmunk97@gmail.com
  '';

  home.file.".ssh/id_ed25519_github.pub".text = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHoxV/uzpDWKBHPlzVqAsJNpkuSyOUlXLGMxldQ563O/ mortenmunk97@gmail.com
  '';

  services.ssh-agent.enable = true;
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "github.com" = {
          addKeysToAgent = "yes";
          identityFile = "~/.ssh/github_private_key";
          identitiesOnly = true;
        };
      };
    };

    git = {
      enable = true;
      userName = "Morten Munk";
      userEmail = "mortenmunk97@gmail.com";
      signing.format = "ssh";
      extraConfig = {
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
  };
}
