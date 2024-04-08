{
  description = "LaTex Dev Env";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShell = pkgs.mkShell {
          name = "Tex-shell";

          buildInputs = with pkgs; [
            texlive.combined.scheme-full
            texlab
          ];
        };
      }
    );
}
