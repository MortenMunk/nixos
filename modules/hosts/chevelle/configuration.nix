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
      chevelleSecrets
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

      inputs.agenix.nixosModules.default
    ];

    home-manager.users.morten = self.homeModules.chevelleHome;

    my.wayland.nvidia.enable = true;
  };
}
