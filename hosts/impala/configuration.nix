{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./system/system.nix
    ./stylix.nix
    ./secrets.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.niri.overlays.niri
    ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.variables.EDITOR = lib.mkOverride 900 "nvim";
  environment.variables.VISUAL = lib.mkOverride 900 "nvim";
  environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";

  # Configure console keymap
  console.keyMap = "dk-latin1";

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.morten = {
      imports = [
        ./home.nix
      ];
    };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  documentation.enable = false;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    brightnessctl
    docker-compose
    lazydocker
    usbutils
    inputs.agenix.packages.${stdenv.hostPlatform.system}.default
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
