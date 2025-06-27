{pkgs, ...}: {
  imports = [
    ./nh.nix
    ./greetd.nix
    ./time.nix
    ./user.nix
    ./power.nix
    ./sound.nix
    ./cachix.nix
    ./network.nix
    ./wayland.nix
    ./udev.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}
