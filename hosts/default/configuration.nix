{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./main-user.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking = {
    networkmanager.enable = true;
    # 127.7.7.6
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    # wireless.userControlled.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [pkgs.xterm];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  programs.uwsm = {
    enable = true;
    waylandCompositors.hyprland = {
      binPath = "/run/current-system/sw/bin/Hyprland";
      prettyName = "Hyprland";
    };
  };

  environment.variables.EDITOR = lib.mkOverride 900 "nvim";
  environment.variables.VISUAL = lib.mkOverride 900 "nvim";
  environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.xwayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "dk-latin1";

  # Power management
  powerManagement = {
    enable = true;
  };

  #services.tlp = {
  #enable = true;
  #settings = {
  #TLP_DEFAULT_MODE = "BAT";
  #TLP_PERSISTENT_DEFAULT = 1;
  #CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

  #CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

  #CPU_MIN_PERF_ON_AC = 0;
  #CPU_MAX_PERF_ON_AC = 100;
  #CPU_MIN_PERF_ON_BAT = 0;
  #CPU_MAX_PERF_ON_BAT = 20;
  #};
  #};

  # Enabled to allow Hyprlock
  security.pam.services.hyprlock = {};

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.morten = {
    isNormalUser = true;
    description = "Morten";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.morten = {
      imports = [
        ./home.nix
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
    };
  };

  # Set default shell
  environment.shells = with pkgs; [
    zsh
  ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nwg-look
    obsidian
    networkmanagerapplet
    brightnessctl
    docker-compose
    lazydocker
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
  };

  catppuccin.sddm = {
    enable = true;
    flavor = "macchiato";
    fontSize = "20";
    background = "/etc/nixos/wallpapers/login.png";
    loginBackground = true;
  };

  # Flake config
  nix.settings = {
    trusted-users = [config.users.users.morten.name];

    experimental-features = ["nix-command" "flakes"];

    builders-use-substitutes = true;

    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://nixpkgs-unfree.cachix.org"
      "https://hyprland.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
