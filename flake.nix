{
  description = "NixOS flake";

  inputs = { nixpkgs.url = "nixpkgs/nixos-23.05"; };

  outputs = { self, nixpkgs }:
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
          modules = [ ./system/framework/configuration.nix ];
        };
      };
    };
}
