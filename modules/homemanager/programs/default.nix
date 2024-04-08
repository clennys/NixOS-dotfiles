{
  lib,
  config,
  ...
}: {
  options = {programs-bundle.enable = lib.mkEnableOption "enables programs bundle";};
  config = lib.mkIf config.programs-bundle.enable {
    imports = [
      ./firefox
      ./alacritty
      ./zathura
    ];
    firefox.enable = lib.mkDefault true;
    alacritty.enable = lib.mkDefault true;
    zathura.enable = lib.mkDefault true;
  };
}
