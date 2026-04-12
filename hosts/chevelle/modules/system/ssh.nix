{...}: {
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

        "ailab-1" = {
          hostname = "ailab-fe01.srv.aau.dk";
          user = "pu74by@student.aau.dk";
          identitiesOnly = true;
        };

        "ailab-2" = {
          hostname = "ailab-fe02.srv.aau.dk";
          user = "pu74by@student.aau.dk";
          identitiesOnly = true;
        };

        "ailab-vpn" = {
          hostname = "ailab-fe02.srv.aau.dk";
          user = "pu74by@student.aau.dk";
          proxyJump = "pu74by@student.aau.dk@sshgw.aau.dk";
          identitiesOnly = true;
        };
      };
    };
  };
}
