{ config, pkgs, ...}:

{
  # if you config gets too long, split it up into smaller modules
  imports = [
    # ./git # looks for ./git/defualt.nix
    # ./hypr/hyprland.nix # looks for ./hypr/hyprland.nix
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
	  platformTheme = "gtk";
	  style.name = "adwaita";
  };

xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["okular" "firefox"];
    };
  };


  home.stateVersion = "23.05";
}
