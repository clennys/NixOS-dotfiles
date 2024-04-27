{
  config,
  lib,
  ...
}: {
  options = {wpaperd.enable = lib.mkEnableOption "enables wpaperd";};
  config = lib.mkIf config.wpaperd.enable {
    programs.wpaperd = {
      enable = true;
      settings = {
        default = {
          path = "~/.dotfiles/users/opts/wpaperd/wallpapers/Barents_bloom.jpg";
        };
      };
    };
  };
}
