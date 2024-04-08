{
  config,
  lib,
  ...
}: {
  options = {xdg.enable = lib.mkEnableOption "enables xdg";};
  config = lib.mkIf config.xdg.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = ["org.kde.okular.desktop" "firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop" "brave.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop" "brave.desktop"];
        "x-scheme-handler/chrome" = ["firefox.desktop" "brave.desktop"];
        "text/html" = ["firefox.desktop" "brave.desktop"];
        "application/x-extension-htm" = ["firefox.desktop" "brave.desktop"];
        "application/x-extension-html" = ["firefox.desktop" "brave.desktop"];
        "application/x-extension-shtml" = ["firefox.desktop" "brave.desktop"];
        "application/xhtml+xml" = ["firefox.desktop" "brave.desktop"];
        "application/x-extension-xhtml" = ["firefox.desktop" "brave.desktop"];
        "application/x-extension-xht" = ["firefox.desktop" "brave.desktop"];
        "image/png" = ["vimiv.desktop" "firefox.desktop" "brave.desktop"];
        "image/jpeg" = ["vimiv.desktop" "firefox.desktop" "brave.desktop"];
        "image/webp" = ["firefox.desktop" "brave.desktop"];
      };
    };
  };
}
