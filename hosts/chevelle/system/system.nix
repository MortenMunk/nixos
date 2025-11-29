{pkgs, ...}: {
  imports = [
    ./user.nix
    ./cachix.nix
    ./nh.nix
    ./greetd.nix
    ./security.nix
    ./time.nix
    ./wayland.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}
