{
  lib,
  config,
  ...
}: {
  options = {nvim.enable = lib.mkEnableOption "enables nvim";};

  config = lib.mkIf config.nvim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
