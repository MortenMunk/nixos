{pkgs, ...}: {
  imports = [
    ./user.nix
    ./cachix.nix
    ./nh.nix
    ./greetd.nix
    ./security.nix
    ./time.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}
