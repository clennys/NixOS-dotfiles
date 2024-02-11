# NOTE: Implemented in Home Manger 24.05
{ config, inputs, pkgs, split-monitor-workspaces, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
    settings = {
      monitor = [ ",preferred,auto,1" "eDP-1,preferred,auto,1.175" ];
      input = {
        kb_layout = "us, us, ch";
        kb_variant = "dvorak-alt-intl, altgr-intl";
        kb_options = "grp:win_space_toggle, caps:escape_shifted_capslock";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
          clickfinger_behavior = true;
        };
        sensitivity = 0;
      };
      plugin = { split-monitor-workspaces = { count = 5; }; };
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 3;
        "col.active_border" = "rgb(005577)";
        "col.inactive_border" = "rgb(1c2023)";
        layout = "master";
      };
      decoration = {
        rounding = 4;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        blur = {
          enabled = true;
          size = 2;
          passes = 5;
          ignore_opacity = true;
          new_optimizations = "on";
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      master = {
        allow_small_split = true;
        new_is_master = true;
        new_on_top = true;
        # no_gaps_when_only = true
        mfact = 0.5;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
      misc = { disable_hyprland_logo = true; };
    };
    "$mod" = "SUPER";
    bind = [
      "$mod SHIFT ALT, Q, exit"
      "$mod SHIFT, C, killactive,"
      "$mod, E, exec, pcmanfm"
      "$mod, W, exec, firefox"
      "$mod SHIFT, Return, exec, alacritty"
      "$mod SHIFT, W, exec, brave"
      "$mod, V, togglefloating,"
      "$mod SHIFT, M, exec,	~/.local/bin/dman"
      "$mod, N, exec, wofi --show=drun -M=fuzzy -i -I"
      "$mod SHIFT, L, exec, swaylock -f -c 000000"
      "$mod SHIFT, S, exec, grimshot --notify save area"
      "$mod, O, exec, ~/.local/bin/dopen"
      "$mod SHIFT, O, exec, ~/.local/bin/ddown"
      "$mod, X, exec, ~/.local/bin/dpower"
      "$mod, j, layoutmsg, cyclenext"
      "$mod, k, layoutmsg, cycleprev"
      "$mod SHIFT, j, layoutmsg, swapnext"
      "$mod SHIFT, k, layoutmsg, swapprev"
      "$mod, c, layoutmsg, orientationcenter"
      "$mod, s, layoutmsg, orientationleft"
      "$mod, r, layoutmsg, orientationright"
      "$mod, t, layoutmsg, orientationtop"
      "$mod, b, layoutmsg, orientationbottom"
      "$mod, i, layoutmsg, addmaster"
      "$mod, d, layoutmsg, removemaster"
      "$mod, return, layoutmsg, swapwithmaster master"
      "$mod, M, layoutmsg, focusmaster"
      "$mod, f, fullscreen"
      "$mod, 1,split-workspace, 1"
      "$mod, 2,split-workspace, 2"
      "$mod, 3,split-workspace, 3"
      "$mod, 4,split-workspace, 4"
      "$mod, 5,split-workspace, 5"
      "$mod, 6,split-workspace, 6"
      "$mod, 7,split-workspace, 7"
      "$mod, 8,split-workspace, 8"
      "$mod, 9,split-workspace, 9"
      "$mod, 0,split-workspace, 10"
      "$mod SHIFT, 1,split-movetoworkspace, 1"
      "$mod SHIFT, 2,split-movetoworkspace, 2"
      "$mod SHIFT, 3,split-movetoworkspace, 3"
      "$mod SHIFT, 4,split-movetoworkspace, 4"
      "$mod SHIFT, 5,split-movetoworkspace, 5"
      "$mod SHIFT, 6,split-movetoworkspace, 6"
      "$mod SHIFT, 7,split-movetoworkspace, 7"
      "$mod SHIFT, 8,split-movetoworkspace, 8"
      "$mod SHIFT, 9,split-movetoworkspace, 9"
      "$mod SHIFT, 0,split-movetoworkspace, 10"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86AudioMedia, exec, wdisplays"
      ",XKB_KEY_XF86Search, exec, $menu"
      "$mod SHIFT, period ,split-changemonitor, next"
      "$mod SHIFT, comma ,split-changemonitor, prev"
    ];
    bindm =
      [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
    binde =
      [ "$mod, H, resizeactive,-10 0" "$mod, L, resizeactive,10 0" ];
    bindl = [
      ",switch:off:Lid Switch,exec,hyprctl keyword monitor 'eDP-1,preferred,auto,1.175'"
      ",switch:on:Lid Switch,exec,hyprctl keyword monitor 'eDP-1, disable'"
    ];
    windowrule = [
      "float, file_progress"
      "float, All Files"
      "float, confirm"
      "float, dialog"
      "float, download"
      "float, notification"
      "float, error"
      "float, splash"
      "float, confirmreset"
      "float, title:Open File"
      "float, title:branchdialog"
      "float, gnome-font"
      "float, org.gnome.Settings"
      "float, file-roller"
      "float, nautilus"
      "float, nemo"
      "float, thunar"
      "tile, Spotify"
      "float, title:^(Picture-in-Picture)$"
      "float, title:^(Firefox — Sharing Indicator)$"
    ];
    blurls = [ "waybar" "swaync" "wofi" "swayosd" ];
    env = [ "QT_QPA_PLATFORM,wayland" ];
    exec-once = [
      "exec-once=hyprpaper"
      "exec-once=gnome-keyring-daemon --daemonize --login"
      "exec-once=swaync"
      "exec-once=waybar"
      "exec-once=nm-applet"
      "exec-once=tmux new -s daemon -d"
      "exec-once=swayidle -w"
      "exec-once=swayosd-server"
    ];
    extraConfig = "";
  };
}
