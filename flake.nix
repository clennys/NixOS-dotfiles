{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
	home-manager = {
		url = "github:nix-community/home-manager/release-23.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, hyprland, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nuc = lib.nixosSystem {
          inherit system;
          modules = [ ./system/nuc/configuration.nix 
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
			home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dhuber = import ./users/nuc/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
		  ];
        };
        framework = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/framework/configuration.nix
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
			home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dhuber = import ./users/dhuber/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
          ];
        };
      };
    };
}
