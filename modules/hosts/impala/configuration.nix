{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.impala = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      impalaModule
    ];
  };

  flake.nixosModules.impalaModule = {pkgs, ...}: {
    imports = with self.nixosModules; [
      impalaSecrets
      myHomeManager
      myStylix
      myWayland
      myUser
      mySecurity
      myNh
      myGreetd
      myNetwork
      myGaming
      myAudio
      myCachix
      myBluetooth

      inputs.agenix.nixosModules.default
    ];

    home-manager.users.morten = self.homeModules.impalaHome;
  };
}
