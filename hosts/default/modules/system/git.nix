{pkgs, ...}: {
    home.packages = with pkgs; [
        git
        lazygit
    ];

    home.file."./ssh/allowed_signers".text = ''
        * ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEfAF+fzpSlaLSjud8attW/E7Yn/wd4s93dO+MnMLDFp mortenmunk97@gmail.com
    '';

    programs = {
        git = {
            enable = true;
            userName = "Morten Munk";
            userEmail = "mortenmunk97@gmail.com";
            extraConfig = {
                commit.gpgsign = true;
                gpg.format = "ssh";
                gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
                user.signingkey = "~/.ssh/id_ed25519.pub";
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