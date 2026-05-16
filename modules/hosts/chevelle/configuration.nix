{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.chevelle = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      chevelleModule
    ];
  };

  flake.nixosModules.chevelleModule = {pkgs, ...}: {
    imports = with self.nixosModules; [
      chevelleModule
      chevelleSecrets

      myHomeManager
      myStylix

      inputs.agenix.nixosModules.default
    ];

    users.users.morten = {
      isNormalUser = true;
      hashedPassword = "$6$yaUWt7jiOj2qI/zE$ExdWt.oTYqd/OP3Ao8oH3t1FwP2NHGNq3bx5PXpZctsDW.wUurYnbppVBC8sGHpYK5utft7Z3HCkHgxVs3zXW/";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "video"
      ];
    };
    home-manager.users.morten = self.homeModules.chevelleHome;
  };
}
