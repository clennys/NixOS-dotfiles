{
  config,
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      		monitor=,preferred,auto,1
      		monitor=eDP-1,preferred,auto,1.25

      		input {
      			kb_layout = us, us, ch
      			kb_variant = dvorak-alt-intl, altgr-intl
      			kb_options = grp:win_space_toggle, caps:escape_shifted_capslock
      			kb_model =
      			kb_rules =

      			follow_mouse = 1

      			touchpad {
      				natural_scroll = no
      			clickfinger_behavior = true
      			}

      			sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      		}


      		general {
      			gaps_in = 5
      			gaps_out = 5
      			border_size = 3
      			col.active_border = rgb(005577)
      			col.inactive_border = rgb(1c2023)

      			layout = master
      		}


      		decoration {
      			rounding = 4

      			active_opacity=1.0
      			inactive_opacity=1.0
      			fullscreen_opacity=1.0

      			blur {
      				enabled=true
      				size = 2
      				passes = 5
      				ignore_opacity=true
      				new_optimizations = on

      			}

      			drop_shadow = yes
      			shadow_range = 4
      			shadow_render_power = 3
      			col.shadow = rgba(1a1a1aee)
      		}

      		animations {
      			enabled = yes

      			bezier = myBezier, 0.05, 0.9, 0.1, 1.05

      			animation = windows, 1, 7, myBezier
      			animation = windowsOut, 1, 7, default, popin 80%
      			animation = border, 1, 10, default
      			animation = fade, 1, 7, default
      			animation = workspaces, 1, 6, default
      		}

      		master {
      			allow_small_split = true
      			new_is_master = true
      			new_on_top = true
      			# no_gaps_when_only = true
      			mfact = 0.5
      		}

      		gestures {
      			workspace_swipe = true
      		}

      		misc {
      				disable_hyprland_logo = true
      			}

      		$mainMod = SUPER
      		$menu wofi --show=drun -M=fuzzy -i -I

      		bind = $mainMod SHIFT ALT, Q, exit
      		bind = $mainMod SHIFT, C, killactive,
      		bind = $mainMod, E, exec, pcmanfm
      		bind = $mainMod, W, exec, firefox
      		bind = $mainMod SHIFT, Return, exec, alacritty
      		bind = $mainMod SHIFT, W, exec, brave
      		bind = $mainMod, V, togglefloating,
      		bind = $mainMod SHIFT, M, exec,	~/.local/bin/dman
      		bind = $mainMod, N, exec, wofi --show=drun -M=fuzzy -i -I
      		bind = $mainMod SHIFT, L, exec, swaylock -f -c 000000
      		bind = $mainMod SHIFT, S, exec, grimshot --notify save area
      		bind = $mainMod, O, exec, ~/.local/bin/dopen
      		bind = $mainMod SHIFT, O, exec, ~/.local/bin/ddown
      		bind = $mainMod, X, exec, ~/.local/bin/dpower

      		bind = $mainMod, j, layoutmsg, cyclenext
      		bind = $mainMod, k, layoutmsg, cycleprev
      		bind = $mainMod SHIFT, j, layoutmsg, swapnext
      		bind = $mainMod SHIFT, k, layoutmsg, swapprev
      		bind = $mainMod, c, layoutmsg, orientationcenter
      		bind = $mainMod, s, layoutmsg, orientationleft
      		bind = $mainMod, r, layoutmsg, orientationright
      		bind = $mainMod, t, layoutmsg, orientationtop
      		bind = $mainMod, b, layoutmsg, orientationbottom
      		bind = $mainMod, i, layoutmsg, addmaster
      		bind = $mainMod, d, layoutmsg, removemaster
      		bind = $mainMod, return, layoutmsg, swapwithmaster master
      		bind = $mainMod, M, layoutmsg, focusmaster
      		bind = $mainMod, f, fullscreen

      		bind = $mainMod, 1, workspace, 1
      		bind = $mainMod, 2, workspace, 2
      		bind = $mainMod, 3, workspace, 3
      		bind = $mainMod, 4, workspace, 4
      		bind = $mainMod, 5, workspace, 5
      		bind = $mainMod, 6, workspace, 6
      		bind = $mainMod, 7, workspace, 7
      		bind = $mainMod, 8, workspace, 8
      		bind = $mainMod, 9, workspace, 9
      		bind = $mainMod, 0, workspace, 10

      		bind = $mainMod SHIFT, 1, movetoworkspace, 1
      		bind = $mainMod SHIFT, 2, movetoworkspace, 2
      		bind = $mainMod SHIFT, 3, movetoworkspace, 3
      		bind = $mainMod SHIFT, 4, movetoworkspace, 4
      		bind = $mainMod SHIFT, 5, movetoworkspace, 5
      		bind = $mainMod SHIFT, 6, movetoworkspace, 6
      		bind = $mainMod SHIFT, 7, movetoworkspace, 7
      		bind = $mainMod SHIFT, 8, movetoworkspace, 8
      		bind = $mainMod SHIFT, 9, movetoworkspace, 9
      		bind = $mainMod SHIFT, 0, movetoworkspace, 10

      		bind = $mainMod, mouse_down, workspace, e+1
      		bind = $mainMod, mouse_up, workspace, e-1

      		bindm = $mainMod, mouse:272, movewindow
      		bindm = $mainMod, mouse:273, resizewindow

      		binde = $mainMod, H, resizeactive,-10 0
      		binde = $mainMod, L, resizeactive,10 0

      		bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
      		bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
      		bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
      		bind = ,XF86AudioMedia, exec, wdisplays
      		bind = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
      		bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%-
      		bind = ,XF86MonBrightnessUp, exec, brightnessctl set 5%+
      		bind = ,XF86AudioPlay, exec, playerctl play-pause
      		bind = ,XF86AudioNext, exec, playerctl next
      		bind = ,XF86AudioPrev, exec, playerctl previous
      		bind = ,XKB_KEY_XF86Search, exec, $menu


      # Window rules
      		windowrule = float, file_progress
      		windowrule = float, All Files
      		windowrule = float, confirm
      		windowrule = float, dialog
      		windowrule = float, download
      		windowrule = float, notification
      		windowrule = float, error
      		windowrule = float, splash
      		windowrule = float, confirmreset
      		windowrule = float, title:Open File
      		windowrule = float, title:branchdialog
      		windowrule = float, gnome-font
      		windowrule = float, org.gnome.Settings
      		windowrule = float, file-roller
      		windowrule = float, nautilus
      		windowrule = float, nemo
      		windowrule = float, thunar
      		windowrule = tile, Spotify
      		windowrule = float, title:^(Picture-in-Picture)$
      		windowrule = float, title:^(Firefox — Sharing Indicator)$

      		blurls = waybar
      		blurls = swaync
      		blurls = wofi

      		env = QT_QPA_PLATFORM,wayland
      		exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      		exec-once=nextcloud
      		exec-once=hyprpaper
      		exec-once=gnome-keyring-daemon --daemonize --login
      		exec-once=swaync
      		exec-once=waybar
      		exec-once=tmux new -s daemon -d
      		exec-once=swayidle -w
    '';
  };
}
