{ config, pkgs, ... }:
{
  imports = [
    ./modules/cli.nix
    ./modules/gpu.nix
  ];

  home = {
    username = "shaamallow";
    homeDirectory = "/home/shaamallow";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
