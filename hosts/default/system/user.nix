{pkgs, ...}: {
  users.users.morten = {
    isNormalUser = true;
    hashedPassword = "$6$yaUWt7jiOj2qI/zE$ExdWt.oTYqd/OP3Ao8oH3t1FwP2NHGNq3bx5PXpZctsDW.wUurYnbppVBC8sGHpYK5utft7Z3HCkHgxVs3zXW/";
    description = "Morten";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  environment.shells = with pkgs; [
    zsh
  ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
