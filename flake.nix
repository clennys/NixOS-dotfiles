{
  description = "NixOS flake";

  inputs = { 
	  nixpkgs.url = "nixpkgs/nixos-23.05"; 
	  nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
      hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, hyprland, ... }:
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
          modules = [ ./system/nuc/configuration.nix ];
        };
	framework = lib.nixosSystem {
          inherit system;
          modules = [ ./system/framework/configuration.nix
		          hyprland.nixosModules.default
        {programs.hyprland.enable = true;}


		  ];
        };
      };
    };
}
