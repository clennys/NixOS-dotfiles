{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {zsh.enable = lib.mkEnableOption "enables zsh config";};

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;

      enableAutosuggestions = true;
      enableCompletion = true;
      dotDir = ".config/zsh";
      defaultKeymap = "viins";

      syntaxHighlighting = {
        enable = true;
        # 	package = pkgs.zsh-syntax-highlighting;
        # 	styles = {
        # 		"builtin" = "fg=blue";
        # 		"command" = "fg=green";
        # 	};
      };

      history = {extended = true;};

      shellAliases = {
        py = "python";
        v = "nvim";
        grep = "grep --color=auto";
        fpush = "git add . && git commit -m 'update' && git push";
        c = "clear";
        ungz = "tar -xvzf";
      };

      initExtra = ''
        zstyle ':completion:*:descriptions' format '%d'
           zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
           # >>> conda initialize >>>
           	__conda_setup="$('/home/dhuber/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
           	if [ $? -eq 0 ]; then
           		eval "$__conda_setup"
           	else
           		if [ -f "/home/dhuber/.conda/etc/profile.d/conda.sh" ]; then
           			. "/home/dhuber/.conda/etc/profile.d/conda.sh"
           		else
           			export PATH="/home/dhuber/.conda/bin:$PATH"
           		fi
           	fi
           	unset __conda_setup
           # <<< conda initialize <<<
      '';
      plugins = [
        {
          name = "fzf-tab";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "190500bf1de6a89416e2a74470d3b5cceab102ba";
            sha256 = "1dipsy0s67fr47ig5559bcp1h5yn8rdjshhs8zsq7j8plvvh99qb";
          };
        }
      ];
    };
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      colors = {
        fg = "#eaebed";
        hl = "#bf616a";
        "fg+" = "#eaebed";
        "hl+" = "#ebcb8b";
        info = "#a3be8c";
        prompt = "#81a1c1";
        pointer = "#bf616a";
        marker = "#ebcb8b";
        spinner = "#96b4b5";
        header = "#81a1c1";
      };
    };

    home.sessionVariables = {
      # FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS' --color=dark
      GOPATH = "$HOME/go";
    };
  };
}
