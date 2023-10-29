{ config, pkgs, ... }:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in
{
  environment.systemPackages = with pkgs; [
    unstable.waybar
    unstable.nixd
	unstable.beeper
	unstable.swaynotificationcenter
	unstable.protonvpn-gui
  ];
}
