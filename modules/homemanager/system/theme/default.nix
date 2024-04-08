{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {theme.enable = lib.mkEnableOption "enables theme";};
  config = lib.mkIf config.theme.enable {
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
    };
    home.pointerCursor = {
      gtk.enable = true;
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    qt = {
      enable = true;
      platformTheme = "gnome";
      style.package = pkgs.adwaita-qt;
      style.name = "adwaita";
    };
  };
}
