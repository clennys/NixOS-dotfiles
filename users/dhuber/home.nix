{ config, pkgs, split-monitor-workspaces, ...}:

{
  # if you config gets too long, split it up into smaller modules
  imports = [
    # ./git # looks for ./git/defualt.nix
    # ./hypr/hyprland.nix # looks for ./hypr/hyprland.nix
	../../modules/zsh
	../../modules/starship
	../../modules/fzf
	../../modules/alacritty
   ];
    
  # The User and Path it manages
  home.username = "dhuber";
  home.homeDirectory = "/home/dhuber";
  
  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # List of user programs
  home.packages = with pkgs; [
	home-manager
    zsh
    git
    firefox
    lazygit
    neovim
	# neovim-nightly
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

	theme = {
		name = "adw-gtk3";
		package = pkgs.adw-gtk3;
	};

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

  };

  qt = {
	  enable = true;
	  platformTheme = "gnome";
	  style.package = pkgs.adwaita-qt;
	  style.name = "adwaita";
  };

  xdg.mimeApps = {
	  enable = true;
	  defaultApplications = {
			"application/pdf" = ["org.kde.okular.desktop" "firefox.desktop"];
			"x-scheme-handler/http" = ["firefox.desktop" "brave.desktop"];
			"x-scheme-handler/https" =  ["firefox.desktop" "brave.desktop"];
			"x-scheme-handler/chrome"= ["firefox.desktop" "brave.desktop"];
			"text/html"=  ["firefox.desktop" "brave.desktop"];
			"application/x-extension-htm" =  ["firefox.desktop" "brave.desktop"];
			"application/x-extension-html" =  ["firefox.desktop" "brave.desktop"];
			"application/x-extension-shtml" =  ["firefox.desktop" "brave.desktop"];
			"application/xhtml+xml" =  ["firefox.desktop" "brave.desktop"];
			"application/x-extension-xhtml" =  ["firefox.desktop" "brave.desktop"];
			"application/x-extension-xht" =  ["firefox.desktop" "brave.desktop"];
			"image/png" = ["vimiv.desktop" "firefox.desktop" "brave.desktop"];
			"image/jpeg" = ["vimiv.desktop" "firefox.desktop" "brave.desktop"];
			"image/webp" = ["firefox.desktop" "brave.desktop"];
		};
  };

  wayland.windowManager.hyprland = {
	plugins = [split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces];
  };


  home.stateVersion = "23.11";
}
