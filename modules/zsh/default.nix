{ pkgs, ... }:

{
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

		history = {
			extended = true;
		};

	
		shellAliases = {
			py = "python";
			v = "nvim";
			ls = "exa --header --long --git";
			grep = "grep --color=auto";
			fpush = "git add . && git commit -m 'update' && git push";
			c = "clear";
			ungz = "tar -xvzf";
			tree = "exa --tree";
		};

		initExtra = ''
		zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
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

		# syntaxHighlighting = {
			# enable = true;
		# };

		oh-my-zsh = {
			enable = true;
			plugins = [
			"fzf"
			"git"
			];
		};

	};

	home.sessionVariables = {
			# FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS' --color=dark --color=fg:#eaebed,bg:-1,hl:#bf616a,fg+:#eaebed,bg+:-1,hl+:#ebcb8b --color=info:#a3be8c,prompt:#81a1c1,pointer:#bf616a,marker:#ebcb8b,spinner:#96b4b5,header:#81a1c1'";
			GOPATH="$HOME/go";
	};



}
