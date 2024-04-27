{
  config,
  lib,
  ...
}: {
  options = {hyprlock.enable = lib.mkEnableOption "enables hyprlock";};
  config = lib.mkIf config.hyprlock.enable {
    home.file.".config/hypr/hyprlock.conf".text = ''
                  	background {
                  		monitor =
                  		path = /home/dhuber/.dotfiles/users/common/optional/system/wpaperd/wallpapers/FW_16_Wallpaper_OG.png # supports png, jpg, webp (no animations, though)
                  		color = rgba(25, 20, 20, 1.0)

                  		# all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
                  		blur_passes = 0 # 0 disables blurring
                  		blur_size = 7
                  		noise = 0.0117
                  		contrast = 0.8916
                  		brightness = 0.8172
                  		vibrancy = 0.1696
                  		vibrancy_darkness = 0.0
                  }
      			input-field {
          monitor =
          size = 500, 100
          outline_thickness = 3
          dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = false
          dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
          outer_color = rgb(1c2023)
          inner_color = rgb(d8dee9)
          font_color = rgb(1c2023)
          fade_on_empty = true
          fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
          placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
          hide_input = false
          rounding = -1 # -1 means complete rounding (circle/oval)
          check_color = rgb(ebcb8b)
          fail_color = rgb(bf616a) # if authentication failed, changes outer_color and fail message color
          fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
          fail_transition = 300 # transition time in ms between normal outer_color and fail_color
          capslock_color = rgb(b48ead)
          numlock_color = -1
          bothlock_color = -1 # when both locks are active. -1 means don't change outer color (same for above)
          invert_numlock = false # change color if numlock is off
          swap_font_color = true # see below

          position = 0, -20
          halign = center
          valign = center
      }
   

    '';
  };
}
