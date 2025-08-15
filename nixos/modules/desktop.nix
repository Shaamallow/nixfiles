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
    feh
    greetd.tuigreet
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent
    nautilus
    playerctl
    rose-pine-hyprcursor
    slurp
    swww
    udiskie
    waybar
    wl-clipboard
    wofi
    yazi
  ];
}
