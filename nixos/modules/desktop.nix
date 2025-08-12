{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    clipse
    greetd.tuigreet
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent
    nautilus
    rose-pine-hyprcursor
    swww
    udiskie
    waybar
    wl-clipboard
    wofi
    yazi
  ];
}
