{ config, pkgs, unstable, split-monitor-workspaces, ... }: {
  imports = [ ../opts ];

  # The User and Path it manages
  home.username = "dhuber";
  home.homeDirectory = "/home/dhuber";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # List of user programs
  home.packages = with pkgs;
    [
      home-manager
      zsh
      git
      firefox
      lazygit
      discord
      firefox
      alacritty
      kitty
      pcmanfm
      nextcloud-client
      zotero
      okular
      starship
      gnome.networkmanager-vpnc
      networkmanager-openvpn
      celluloid
      networkmanagerapplet
      signal-desktop
      spotify
      wofi
      brave
	  wpaperd
      hyprpicker
      dunst
      xdg-desktop-portal-hyprland
      nixfmt
      hyprland-protocols
      gnome.gnome-keyring
      polkit_gnome
      pavucontrol
      playerctl
      brightnessctl
      wdisplays
      sway-contrib.grimshot
      swaylock
      swayidle
      mpv
      vscode.fhs
      deluge-gtk
      vimiv-qt
      nix-prefetch-git
      pnmixer
      volumeicon
      usbutils
      nixd
      swaynotificationcenter
      waybar
      foliate
      btop
      wl-mirror
	  grim
	  slurp
	  swappy
    ] ++ [ unstable.beeper unstable.swayosd ] ++ [
      (import ../scripts/wofi/dman.nix { inherit pkgs; })
      (import ../scripts/wofi/dpower.nix { inherit pkgs; })
      (import ../scripts/wofi/dopen.nix { inherit pkgs; })
      (import ../scripts/wofi/ddown.nix { inherit pkgs; })
    ];

  home.stateVersion = "23.11";
}
