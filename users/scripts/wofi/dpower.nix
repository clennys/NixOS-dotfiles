{ pkgs }:
pkgs.writeShellScriptBin "dpower" ''
choices="shutdown\nreboot\nhibernate\nlock"

chosen=$(echo -e "$choices" | wofi --show=dmenu -p "Powermenu:")

case "$chosen" in
	shutdown) systemctl poweroff;;
	reboot) systemctl reboot;;
	hibernate) systemctl hibernate;;
	lock) swaylock -f -c 000000;;
esac
''
