{
  config,
  pkgs,
  ...
}: let
  baseconfig = {allowUnfree = true;};
  # TODO: (dhub) fetches nixos-unstable channel not from the nix flake
  unstable = import <nixos-unstable> {config = baseconfig;};
in {
  environment.systemPackages = with pkgs; [
    unstable.swayosd
    unstable.beeper
  ];
}
