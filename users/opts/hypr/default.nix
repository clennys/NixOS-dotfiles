{ config, inputs, pkgs, split-monitor-workspaces, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
	package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
    extraConfig = ''
            monitor=,preferred,auto,1
            monitor=eDP-1,preferred,auto,1.175
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
            plugin {
                split-monitor-workspaces {
                    count = 5
                }
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
            	workspace_swipe_forever = true
            }
            device:epic mouse V1 {
                sensitivity = -0.5
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
            bind = $mainMod SHIFT, M, exec,	dman
            bind = $mainMod, N, exec, wofi --show=drun -M=fuzzy -i -I
            bind = $mainMod SHIFT, L, exec, swaylock -f -c 000000
            bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -
            bind = $mainMod, O, exec, dopen
            bind = $mainMod SHIFT, O, exec, ddown
            bind = $mainMod, X, exec, dpower

            # Move focus with mainMod + arrow keys
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

            # Switch workspaces with mainMod + [0-9]
            bind = $mainMod, 1,split-workspace, 1
            bind = $mainMod, 2,split-workspace, 2
            bind = $mainMod, 3,split-workspace, 3
            bind = $mainMod, 4,split-workspace, 4
            bind = $mainMod, 5,split-workspace, 5
            bind = $mainMod, 6,split-workspace, 6
            bind = $mainMod, 7,split-workspace, 7
            bind = $mainMod, 8,split-workspace, 8
            bind = $mainMod, 9,split-workspace, 9
            bind = $mainMod, 0,split-workspace, 10

            # Move active window to a workspace with mainMod + SHIFT + [0-9] bind = $mainMod SHIFT, 1, movetoworkspace, 1
            bind = $mainMod SHIFT, 1,split-movetoworkspace, 1
            bind = $mainMod SHIFT, 2,split-movetoworkspace, 2
            bind = $mainMod SHIFT, 3,split-movetoworkspace, 3
            bind = $mainMod SHIFT, 4,split-movetoworkspace, 4
            bind = $mainMod SHIFT, 5,split-movetoworkspace, 5
            bind = $mainMod SHIFT, 6,split-movetoworkspace, 6
            bind = $mainMod SHIFT, 7,split-movetoworkspace, 7
            bind = $mainMod SHIFT, 8,split-movetoworkspace, 8
            bind = $mainMod SHIFT, 9,split-movetoworkspace, 9
            bind = $mainMod SHIFT, 0,split-movetoworkspace, 10

            # Scroll through existing workspaces with mainMod + scroll
            bind = $mainMod, mouse_down, workspace, e+1
            bind = $mainMod, mouse_up, workspace, e-1

            # Move/resize windows with mainMod + LMB/RMB and dragging
            bindm = $mainMod, mouse:272, movewindow
            bindm = $mainMod, mouse:273, resizewindow

            binde = $mainMod, H, resizeactive,-10 0
            binde = $mainMod, L, resizeactive,10 0

            # bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
            bind = ,XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise
            # bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
            bind = ,XF86AudioLowerVolume, exec, swayosd-client --output-volume lower
            # bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
            bind = ,XF86AudioMute, exec, swayosd-client --output-volume mute-toggle
            # bind = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
            bind = ,XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle

            bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%-
            bind = ,XF86MonBrightnessUp, exec, brightnessctl set 5%+
            # bind = ,XF86MonBrightnessDown, exec, swayosd-client --brightness lower
            # bind = ,XF86MonBrightnessUp, exec, swayosd-client --brightness raise

            bind = ,XF86AudioPlay, exec, playerctl play-pause
            bind = ,XF86AudioNext, exec, playerctl next
            bind = ,XF86AudioPrev, exec, playerctl previous

            bind = ,XF86AudioMedia, exec, wdisplays
            bind = ,XKB_KEY_XF86Search, exec, $menu

            # Capslock (If you don't want to use the backend)
            # bind = bindsym --release Caps_Lock exec swayosd-client --caps-lock

            bind = $mainMod SHIFT, period ,split-changemonitor, next
            bind = $mainMod SHIFT, comma ,split-changemonitor, prev

			# trigger when the switch is toggled
		    # bindl=,switch:[switch name],exec,swaylock
			# trigger when the switch is turning on
			bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1,preferred,auto,1.175"
			# trigger when the switch is turning off
			bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"

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
            # windowrule = float, pcmanfm
            # windowrule = float, pavucontrol
            windowrule = tile, Spotify
            windowrule = float, title:^(Picture-in-Picture)$
            windowrule = float, title:^(Firefox — Sharing Indicator)$

            blurls = waybar
            blurls = swaync
            blurls = wofi
            blurls = swayosd


            env = QT_QPA_PLATFORM,wayland
            # exec-once=nextcloud
            exec-once=wpaperd
            exec-once=gnome-keyring-daemon --daemonize --login
            exec-once=swaync
            exec-once=waybar
            exec-once=nm-applet
            exec-once=tmux new -s daemon -d
            exec-once=swayidle -w
            exec-once=swayosd-server

    '';
  };
}
