# Betterdiscord configuration
# Run `betterdiscordctl install` to install betterdiscord
{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  home.packages = with pkgs; [
    discord
    betterdiscordctl
  ];
}
