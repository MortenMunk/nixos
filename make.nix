{
  inputs,
  lib,
  ...
}: let
  mkNixOS = {
    hostname,
    system ? "x86_64-linux",
    remote ? false,
    thinkpad ? false,
  }: let
    hostConfig = ./hosts + "/${hostname}/configuration.nix";
  in
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules =
        [
          hostConfig
          {
            nixpkgs = {
              system = system;
              config.allowUnfree = true;
            };

            networking.hostName = hostname;

            nix.nixPath = [
              "nixpkgs=${inputs.nixpkgs}"
            ];
          }
        ]
        ++ lib.optionals (!remote) [
          inputs.home-manager.nixosModules.default
          inputs.agenix.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ]
        ++ lib.optionals thinkpad [
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1
        ];
    };
in {inherit mkNixOS;}
