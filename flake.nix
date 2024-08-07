{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    hyprland,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };
    unstable = import nixpkgs-unstable {
      inherit system;
      config = {allowUnfree = true;};
    };
    lib = nixpkgs.lib;
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/homemanager;
    # overlays = import ./overlays { inherit inputs outputs; };
    devShells = import ./shell.nix {inherit system pkgs;};

    nixosConfigurations = {
      framework = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/framework/configuration.nix
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dhuber = import ./users/dhuber/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs unstable;};
            # home-manager.sharedModules = [ ./modules/homemanager ];
          }
        ];
      };
	  # INFO: Command: nix build .#nixosConfigurations.minimal-iso.config.system.build.isoImage
      minimal-iso = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/isoimages/minimal-iso.nix];
      };
    };
  };
}
