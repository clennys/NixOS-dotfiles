#aliases
alias py="python3"
alias pip="pip3"
alias v="nvim"
alias s="sudo"
alias edit='nvim'
alias root='sudo -i'
alias su='sudo -i'
alias sv='sudoedit'
alias ls="exa --header --long --git"
alias ll="exa --header --long --git"
alias pic="sxiv"
alias g="git"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias gig="git rm -r --cached . && git add . && git commit -am 'Remove ignored files'"
alias gssh="git remote set-url origin"
alias vifm="~/.config/vifm/scripts/vifmrun"
alias net="nmtui"
alias grep='grep --color=auto'
alias fpush="git add . && git commit -m 'update' && git push"
alias d="dirs -v"
alias c='clear'
alias cd='z'
alias fullcharge='sudo tlp fullcharge'
alias ungz='tar -xvzf'
alias bat='cat /sys/class/power_supply/BAT1/capacity'
alias transfer='~/Nextcloud/other/transfer'
alias vpn-uzh='sudo nmcli connection up uzh --ask'
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"
alias jn='jupyter notebook'
alias mpicc="/usr/lib64/openmpi/bin/mpicxx"
