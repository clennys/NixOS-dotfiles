{pkgs}:
pkgs.writeShellScriptBin "dman" ''
  alacritty -e man $(apropos --long . | wofi --show=dmenu -l 30 | awk '{print $2, $1}' | tr -d '()')
''
