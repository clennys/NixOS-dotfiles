{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    clock24 = true;
    keyMode = "vi";

    # Stop tmux+escape craziness.
    escapeTime = 0;

    plugins = with pkgs; [ tmuxPlugins.resurrect ];

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
           set -g status-bg default
		   set -g status-interval 1
           set -g status-right "#(pomo)"

		   set -g default-terminal "tmux-256color"
           set -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };
}
