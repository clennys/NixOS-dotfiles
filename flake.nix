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
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, hyprland, home-manager
    , split-monitor-workspaces, anyrun, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      unstable = import nixpkgs-unstable {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
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
              home-manager.extraSpecialArgs = {
                inherit unstable split-monitor-workspaces inputs anyrun;
              };
            }
          ];
        };
		minimal-iso = lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
			./hosts/isoimages/minimal-iso.nix
			];
		};
      };
    };
}
