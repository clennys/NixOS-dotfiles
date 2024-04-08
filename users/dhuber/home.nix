{
  pkgs,
  unstable,
  ...
}: {
  imports = [../../modules/homemanager];

  # The User and Path it manages
  home.username = "dhuber";
  home.homeDirectory = "/home/dhuber";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # List of user programs
  home.packages = with pkgs;
    [
      home-manager
      lazygit
      discord
      kitty
      pcmanfm
      okular
      gnome.networkmanager-vpnc
      networkmanager-openvpn
      celluloid
      networkmanagerapplet
      spotify
      brave
      hyprpicker
      xdg-desktop-portal-hyprland
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
      # nixd
      swaynotificationcenter
      waybar
      btop
      wl-mirror
      grim
      slurp
      swappy
      numbat
      anki
      gnome.seahorse
    ]
    ++ [unstable.beeper unstable.swayosd]
    ++ [
      (import ../scripts/wofi/dman.nix {inherit pkgs;})
      (import ../scripts/wofi/dpower.nix {inherit pkgs;})
      (import ../scripts/wofi/dopen.nix {inherit pkgs;})
      (import ../scripts/wofi/ddown.nix {inherit pkgs;})
      (import ../scripts/hypr/sleep.nix {inherit pkgs;})
    ];

  home.stateVersion = "23.11";
}
