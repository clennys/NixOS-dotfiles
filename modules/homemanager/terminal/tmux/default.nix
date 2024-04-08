{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {tmux.enable = lib.mkEnableOption "enables tmux";};
  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      shortcut = "a";
      baseIndex = 1;
      newSession = true;
      clock24 = true;
      keyMode = "vi";

      # Stop tmux+escape craziness.
      escapeTime = 0;

      plugins = with pkgs; [tmuxPlugins.resurrect];

      extraConfig = ''
              set -g history-limit 20000

              bind s split-window -v
              bind v split-window -h
              bind t new-window -c '#{pane_current_path}'
              bind r command-prompt -I '#S' 'rename-session "%%"'

              set -g mouse on

              set -g status-style "fg=#697884"
              set -g status-left-style "fg=#d9dee9"
        set -g status-position top

              set -g status-left ""
         set -g status-right ""
              set -g status-bg default
        set -g status-interval 1

        bind -n C-h select-pane -L
        bind -n C-j select-pane -D
        bind -n C-k select-pane -U
        bind -n C-l select-pane -R

        set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

        set -g default-terminal "tmux-256color"
              set -ag terminal-overrides ",xterm-256color:RGB"
      '';
    };
  };
}
