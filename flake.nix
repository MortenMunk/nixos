{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nixvim.url = "github:MortenMunk/nixvim";
    zjstatus.url = "github:dj95/zjstatus";
    agenix.url = "github:ryantm/agenix";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs = {
    self,
    nixpkgs,
    agenix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in
    with import ./make.nix {
      inherit inputs lib;
    }; {
      packages.${system}.agenix = agenix.packages.${system}.default;

      nixosConfigurations = {
        # laptop
        impala = mkNixOS {
          hostname = "impala";
          thinkpad = true;
        };
        #desktop
        chevelle = mkNixOS {
          hostname = "chevelle";
        };
      };
    };
}
