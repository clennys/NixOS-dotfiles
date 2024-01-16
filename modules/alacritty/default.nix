{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
		 padding = {
        x = 10;
        y = 10;
		 };
		  opacity = 0.85;
      };
      font = {
        normal = {
          family = "Terminess Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Terminess Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Terminess Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "Terminess Nerd Font";
          style = "Bold Italic";
        };
        size = 16;
      };

      colors = {
        primary = {
          background = "#1c2023";
          foreground = "#eaebed";

        };

        normal = {
          black = "#1c2023";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#96b5b4";
          white = "#d8dee9";
        };

        bright = {
          black = "#697884";
          red = "#C5727A";
          green = "#B1C89d";
          yellow = "#EFD49F";
          blue = "#5e81ac";
          magenta = "#BE9DB8";
          cyan = "#9FC6C5";
          white = "#d8dee9";
        };
      };
	  cursor = {
		  style = "underline";
	  };
    };
  };
}
