{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command =
          "'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'";
      }
      {
        timeout = 305;
        command = "'swaylock -f -c 000000'";
      }
    ];
    events = [{
      event = "before-sleep";
      command = "'swaylock -f -c 000000'";
    }];
  };
}
