{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nomad = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      nomadModule
    ];
  };

  flake.nixosModules.nomadModule = {
    pkgs,
    config,
    lib,
    ...
  }: {
    imports = with self.nixosModules; [
      nomadSecrets
      inputs.agenix.nixosModules.default
      inputs.media-server.nixosModules.default
    ];

    system.stateVersion = "25.05";
    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking = {
      hostName = "nomad";
      useNetworkd = true;
      enableIPv6 = false;
    };

    boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;

      initrd = {
        systemd.enable = true;
        availableKernelModules = ["r8169" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
      };
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };

    services.openssh.enable = true;

    users.users.morten = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker"];
    };
  };
}
