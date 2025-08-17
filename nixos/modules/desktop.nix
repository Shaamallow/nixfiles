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
    adw-gtk3
    clipse
    feh
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent
    nautilus
    nwg-look # because gtk theming is shit, use this tool if necessary
    papirus-icon-theme
    playerctl
    rose-pine-hyprcursor
    slurp
    swww
    tuigreet
    udiskie
    waybar
    wl-clipboard
    wofi
    yazi
  ];
}
