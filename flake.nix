{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        catppuccin.url = "github:catppuccin/nix";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland = {
            type = "git";
            url = "https://github.com/hyprwm/Hyprland";
            submodules = true;
        };
	      nixvim = {
	          url = "github:nix-community/nixvim";
	          inputs.nixpkgs.follows = "nixpkgs";
	      };
    };

    outputs = { self, nixpkgs, hyprland, home-manager, catppuccin, nixvim, ... }@inputs:
        let 
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            nixosConfigurations.default = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/default/configuration.nix
                    inputs.home-manager.nixosModules.default
                    catppuccin.nixosModules.catppuccin
		                nixvim.nixosModules.nixvim
                ];
            };
    };
}
