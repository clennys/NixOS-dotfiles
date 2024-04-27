{
  config,
  lib,
  ...
}: {
  options = {swayidle.enable = lib.mkEnableOption "enables swayidle";};
  config = lib.mkIf config.swayidle.enable {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 360;
          command = "hyprctl dispatch dpms off";
        }
        {
          timeout = 300;
          command = "'swaylock -f -c 000000'";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "'swaylock -f -c 000000'";
        }
        {
          event = "after-resume";
          command = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
