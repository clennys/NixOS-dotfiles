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
          family = "IntelOne Mono";
          style = "Regular";
        };
        bold = {
          family = "IntelOne Mono";
          style = "Medium";
        };
        italic = {
          family = "IntelOne Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "IntelOne Mono";
          style = "Medium Italic";
        };
        size = 13;
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
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#D08770";
          blue = "#5e81ac";
          magenta = "#b48ead";
          cyan = "#96b5b4";
          white = "#d8dee9";
        };
      };
	  cursor = {
		  style = "underline";
	  };
    };
  };
}
