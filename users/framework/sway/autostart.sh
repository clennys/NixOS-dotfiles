#!/bin/sh

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"
export QT_QPA_PLATFORMTHEME=qt5ct
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="pcmanfm"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:#eaebed,bg:#1c2023,hl:#bf616a,fg+:#eaebed,bg+:#1c2023,hl+:#ebcb8b
--color=info:#a3be8c,prompt:#81a1c1,pointer:#bf616a,marker:#ebcb8b,spinner:#96b4b5,header:#81a1c1'
# export MANPAGER="nvim -c 'set ft=man' -"
export GOPATH=$HOME/go
export SSH_AUTH_SOCK
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-1.fc36.x86_64

/usr/libexec/polkit-gnome-authentication-agent-1 &
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
gnome-keyring-daemon --daemonize --login

low_battery.sh&
