{
  lib,
  config,
  ...
}: {
  options = {system-bundle.enable = lib.mkEnableOption "enables system bundle";};
  config = lib.mkIf config.system-bundle.enable {
    imports = [
      ./hypr
      ./waybar
      ./xdg
      ./theme
      ./swaync
      ./wofi
      ./swayidle
      ./wpaperd
    ];
    hypr.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
    xdg.enable = lib.mkDefault true;
    theme.enable = lib.mkDefault true;
    swaync.enable = lib.mkDefault true;
    wofi.enable = lib.mkDefault true;
    swayidle.enable = lib.mkDefault true;
    wpaperd.enable = lib.mkDefault true;
  };
}
