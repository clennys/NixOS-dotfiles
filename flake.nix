{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
	home-manager = {
		url = "github:nix-community/home-manager/release-23.11";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
	neovim-nightly-overlay = {
		url = "github:nix-community/neovim-nightly-overlay";
	};
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, hyprland, home-manager, split-monitor-workspaces, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
		overlays = [inputs.neovim-nightly-overlay.overlay];
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nuc = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/nuc/configuration.nix 
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
            ./hosts/framework/configuration.nix
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
