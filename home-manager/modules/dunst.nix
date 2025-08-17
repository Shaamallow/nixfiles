{ config, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        separator_color = "frame";
        highlight = "#8aadf4";
        font = "CaskaydiaCove Regular 11";
        corner_radius = 15;
        offset = "10x10";
        origin = "top-right";
        notification_limit = 8;
        gap_size = 7;
        frame_width = 0;
        frame_color = "#8aadf4";
        width = 300;
        height = 100;
      };

      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
      };

      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
      };

      urgency_critical = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_width = 2;
        frame_color = "#f5a97f";
      };
    };
  };
}
