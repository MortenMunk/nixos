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
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.variables.EDITOR = lib.mkOverride 900 "nvim";
  environment.variables.VISUAL = lib.mkOverride 900 "nvim";
  environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";

  # Configure console keymap
  console.keyMap = "dk-latin1";

  # Enabled to allow Hyprlock
  security.pam.services.hyprlock = {};

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.morten = {
      imports = [
        ./home.nix
      ];
    };
  };

  environment.shells = with pkgs; [
    zsh
  ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    brightnessctl
    docker-compose
    lazydocker
    sddm-astronaut
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  system.stateVersion = "24.05"; # Did you read the comment?
}
