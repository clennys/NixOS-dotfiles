{
  lib,
  config,
  unstable,
  ...
}: {
  options = {nvim.enable = lib.mkEnableOption "enables nvim";};

  config = lib.mkIf config.nvim.enable {
    programs.neovim = {
      enable = true;
	  package = unstable.neovim-unwrapped;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
