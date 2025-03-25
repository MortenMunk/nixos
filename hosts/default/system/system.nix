{...}: {
  imports = [
    ./sddm.nix
    ./time.nix
    ./user.nix
    ./power.nix
    ./sound.nix
    ./cachix.nix
    ./network.nix
    ./wayland.nix
  ];
}
