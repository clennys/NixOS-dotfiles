#sudo-toggle
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line

# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line

# cd() # cd and ls after
# {
# 	builtin cd "$@" && command exa --color=always
# }

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
	   [[ ${KEYMAP} = '' ]] || [[ $1 = 'underline' ]]; then
		echo -ne '\e[4 q'
	fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[4 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
	echo -ne '\e[4 q'
}

precmd_functions+=(_fix_cursor)
