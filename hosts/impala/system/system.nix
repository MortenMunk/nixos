{pkgs, ...}: {
  imports = [
    ./nh.nix
    ./bluetooth.nix
    ./greetd.nix
    ./time.nix
    ./user.nix
    ./power.nix
    ./sound.nix
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
