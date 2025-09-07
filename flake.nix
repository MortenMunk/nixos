{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nixvim.url = "github:MortenMunk/nixvim";
    stylix.url = "github:danth/stylix";
    zjstatus.url = "github:dj95/zjstatus";
  };

  outputs = inputs:
    with import ./make.nix {
      inherit inputs;
      lib = inputs.nixpkgs.lib;
    }; {
      nixosConfigurations = {
        # laptop
        impala = mkNixOS {
          hostname = "impala";
          thinkpad = true;
        };
      };
    };
}
