{self, ...}: {
  flake.nixosModules.myUser = {pkgs, ...}: {
    users.users.morten = {
      isNormalUser = true;
      hashedPassword = "$6$yaUWt7jiOj2qI/zE$ExdWt.oTYqd/OP3Ao8oH3t1FwP2NHGNq3bx5PXpZctsDW.wUurYnbppVBC8sGHpYK5utft7Z3HCkHgxVs3zXW/";
      description = "Morten";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "video"
      ];
    };

    environment.systemPackages = with pkgs; [
      just
    ];

    environment.shells = with pkgs; [
      zsh
    ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    time.timeZone = "Europe/Copenhagen";

    i18n.defaultLocale = "en_DK.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "da_DK.UTF-8";
      LC_IDENTIFICATION = "da_DK.UTF-8";
      LC_MEASUREMENT = "da_DK.UTF-8";
      LC_MONETARY = "da_DK.UTF-8";
      LC_NAME = "da_DK.UTF-8";
      LC_NUMERIC = "da_DK.UTF-8";
      LC_PAPER = "da_DK.UTF-8";
      LC_TELEPHONE = "da_DK.UTF-8";
      LC_TIME = "da_DK.UTF-8";
    };
  };
}
