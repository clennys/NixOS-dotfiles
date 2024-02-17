{
  programs.zathura = {
    enable = true;
    options = {
      font = "Terminess Nerd Font 15";
      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = 1;
      scroll-page-aware = true;
      # smooth-scroll = true;
      # scroll-full-overlap = 1.0e-2;
      scroll-step = 100;
      recolor-lightcolor = "#1C2023";
      recolor-darkcolor = "#ffffff";
	  recolor-keephue = true;

      default-bg = "#1C2023";
      default-fg = "#eaebed";

      index-bg = "#1C2023";
      index-fg = "#eaebed";

      statusbar-h-padding = 8;
      statusbar-v-padding = 2;

      statusbar-fg = "#eaebed";
      statusbar-bg = "#1C2023";

      statusbar-home-tilde = true;

      completion-bg = "#1C2023";
      completion-fg = "#eaebed";

      completion-highlight-bg = "#81a1c1";
      completion-highlight-fg = "#1C2023";

      inputbar-bg = "#1C2023";
      inputbar-fg = "#eaebed";

      notification-bg = "#1C2023";
      notification-fg = "#eaebed";

      notification-error-fg = "#1C2023";
      notification-error-bg = "#81a1c1";

      notification-warning-fg = "#1C2023";
      notification-warning-bg = "#81a1c1";

      index-active-fg = "#1C2023";
      index-active-bg = "#81a1c1";

      highlight-active-color = "#81a1c1";
      highlight-color = "#81a1c1";

      statusbar-basename = true;
    };
    mappings = {
      p = "print";
      "<C-i>" = "recolor";
    };
  };
}
