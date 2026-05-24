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

  flake.nixosModules.chevelleModule = {lib, ...}: {
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
      inputs.stylix.nixosModules.stylix
      inputs.niri.nixosModules.niri
    ];

    home-manager.users.morten = self.homeModules.chevelleHome;

    my.wayland.nvidia.enable = true;

    boot.loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
      };
    };

    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        inputs.niri.overlays.niri
      ];
    };

    environment.variables.EDITOR = lib.mkOverride 900 "nvim";
    environment.variables.VISUAL = lib.mkOverride 900 "nvim";
    environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";

    networking.hostName = "chevelle";

    console.keyMap = "dk-latin1";
    system.stateVersion = "25.05";
  };
}
