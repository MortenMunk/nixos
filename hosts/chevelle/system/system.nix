{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./user.nix
    ./cachix.nix
    ./nh.nix
    ./greetd.nix
    ./security.nix
    ./time.nix
    ./wayland.nix
    ./gaming.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}
