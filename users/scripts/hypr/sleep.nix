{pkgs}:
pkgs.writeShellScriptBin "hypr-sleep" ''
  swayidle -w timeout 300 'swaylock -f -e -i ~/.dotfiles/users/opts/wpaperd/wallpapers/FW_16_Wallpaper_OG.png' \
              timeout 600 'hyprctl dispatch dpms off' \
              resume 'hyprctl dispatch dpms on' \
              timeout 900 'systemctl suspend' \
              before-sleep 'swaylock -f -e -i ~/.dotfiles/users/opts/wpaperd/wallpapers/FW_16_Wallpaper_OG.png'&
''
