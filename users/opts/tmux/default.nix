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

         # Enable mouse control (clickable windows, panes, resizable panes)
         set -g mouse on

         set-option -g status-style "bg=default, fg=blue"

         setw -g window-status-format ' #I:#W '
         setw -g window-status-current-format ' #I:[#W] '
         set-option -g status-left "[#S]"
         set -g status-right "%Y-%m-%d %H:%M #H"
		  set -g default-terminal "tmux-256color"
		  set -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };
}
