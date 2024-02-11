{ pkgs }:
pkgs.writeShellScriptBin "ddown" ''
filemanager=pcmanfm
term=alacritty
editor=nvim
videoplayer=mpv
audioplayer=mpv
imageviewer=vimiv
pdfviewer=okular

path="$(fd . /home/dhuber/Downloads | wofi --show=dmenu -l 30 -p "Open File/Dir:")"

[[ -d "$path" ]] && ($term -e $filemanager "$path" &) && exit

case "$(xdg-mime query filetype "$path")" in

	text/*) ($term -e $editor "$path" &);;
	video/*) "$videoplayer" "$path";;
	audio/*) "$audioplayer" "$path";;
	image/*) "$imageviewer" "$path";;
	application/pdf*) "$pdfviewer" "$path";;
	*) xdg-open "$path";;
esac
''
