{
  lib,
  config,
  ...
}: {
  options = {terminal-bundle.enable = lib.mkEnableOption "enables terminal bundle";};

  config = lib.mkIf config.terminal-bundle.enable {
    imports = [
      ./starship
      ./zsh
      ./nvim
      ./git
      ./eza
      ./direnv
      ./tmux
    ];
    starship.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    fzf.enable = lib.mkDefault true;
    nvim.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    eza.enable = lib.mkDefault true;
    direnv.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
  };
}
