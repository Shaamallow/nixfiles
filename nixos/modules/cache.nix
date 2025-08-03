# Nix cache sources
{ config, pkgs, ... }:
{
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org" # additional nix-community sources
      "https://hyprland.cachix.org" # hyprland caching if needed
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  environment.systemPackages = with pkgs; [
    cachix
  ];
}
