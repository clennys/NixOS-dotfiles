{ config, pkgs, ... }:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <unstable> { config = baseconfig; };
in
{
  environment.systemPackages = with pkgs; [
    unstable.waybar
    unstable.nixd
	unstable.mozillavpn
	unstable.beeper
	unstable.swaynotificationcenter
  ];
}
