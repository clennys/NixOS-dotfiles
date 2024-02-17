{ config, pkgs, unstable, split-monitor-workspaces, ... }: {
  imports = [
    ./hypr
    ./waybar
    ./starship
    ./zsh
    ./fzf
    ./alacritty
    ./nvim
    ./system
    ./theme
	./tmux
	./swaync
	./wofi
	./swayidle
	./wpaperd
	./firefox
	./git
	./zathura
	./eza
  ];
}
