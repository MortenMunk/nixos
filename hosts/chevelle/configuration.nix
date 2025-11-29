{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./system/system.nix
    inputs.niri.nixosModules.niri
    ./stylix.nix
    ./secrets.nix
  ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.variables.EDITOR = lib.mkOverride 900 "nvim";
  environment.variables.VISUAL = lib.mkOverride 900 "nvim";
  environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.morten = {
      imports = [
        ./home.nix
      ];
    };
  };

  # Configure console keymap
  console.keyMap = "dk-latin1";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
