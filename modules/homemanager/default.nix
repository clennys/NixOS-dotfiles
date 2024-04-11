{lib, ...}: {
  imports = [
    ./programs/firefox
    ./programs/zathura
    ./programs/alacritty
    ./system/hypr
    ./system/waybar
    ./system/xdg
    ./system/theme
    ./system/swaync
    ./system/wofi
    ./system/swayidle
    ./system/wpaperd
    ./terminal/starship
    ./terminal/zsh
    ./terminal/nvim
    ./terminal/git
    ./terminal/eza
    ./terminal/direnv
    ./terminal/tmux
  ];
  # system-bundle.enable = lib.mkDefault true;
  # programs-bundle.enable = lib.mkDefault true;
  # terminal-bundle.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  alacritty.enable = lib.mkDefault true;
  zathura.enable = lib.mkDefault true;

  starship.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  eza.enable = lib.mkDefault true;
  direnv.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;

  hyprland.enable = lib.mkDefault true;
  waybar.enable = lib.mkDefault true;
  xdg-mime.enable = lib.mkDefault true;
  theme.enable = lib.mkDefault true;
  swaync.enable = lib.mkDefault true;
  wofi.enable = lib.mkDefault true;
  swayidle.enable = lib.mkDefault true;
  wpaperd.enable = lib.mkDefault true;
}
