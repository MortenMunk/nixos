{pkgs, ...}: {
  imports = [
    ./user.nix
    ./cachix.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}
