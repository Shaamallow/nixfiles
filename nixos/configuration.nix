{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration/hardware-configuration.nix
    ./modules/bluetooth.nix
    ./modules/boot.nix
    ./modules/cache.nix
    ./modules/desktop.nix
    ./modules/display-manager.nix
    ./modules/fonts.nix
    ./modules/packages.nix
    ./modules/sound.nix
    ./modules/users.nix
  ];

  networking.hostName = "nixmaster";
  networking.networkmanager.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker = {
    enable = true;
    logDriver = "json-file"; # Recommended default. NixOS sets it to "journald" by default.
    enableOnBoot = false;
  };

  time.timeZone = "Europe/Paris";

  programs.firefox.enable = true;
  programs.nix-ld.enable = true;

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  system.stateVersion = "25.05";
}
