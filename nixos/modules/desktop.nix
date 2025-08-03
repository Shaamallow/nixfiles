{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    clipse
    hypridle
    hyprlock
    hyprpolkitagent
    nautilus
    rose-pine-hyprcursor
    swww
    udiskie
    waybar
    wofi
    wl-clipboard
    yazi
  ];
}
