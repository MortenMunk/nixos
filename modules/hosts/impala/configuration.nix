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

  flake.nixosModules.impalaModule = {lib, ...}: {
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
      inputs.stylix.nixosModules.stylix
      inputs.niri.nixosModules.niri
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1
    ];

    home-manager.users.morten = self.homeModules.impalaHome;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    environment.variables.EDITOR = lib.mkOverride 900 "nvim";
    environment.variables.VISUAL = lib.mkOverride 900 "nvim";
    environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";

    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        inputs.niri.overlays.niri
      ];
    };

    networking.hostName = "impala";

    console.keyMap = "dk-latin1";
    system.stateVersion = "24.05";
  };
}
