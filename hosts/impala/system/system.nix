{pkgs, ...}: {
  imports = [
    ./nh.nix
    ./bluetooth.nix
    ./gaming.nix
    ./greetd.nix
    ./time.nix
    ./user.nix
    ./power.nix
    ./audio.nix
    ./security.nix
    ./cachix.nix
    ./network.nix
    ./wayland.nix
    ./udev.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}
