{
  lib,
  config,
  ...
}: {
  options = {direnv.enable = lib.mkEnableOption "enables direnv";};
  config = lib.mkIf config.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
