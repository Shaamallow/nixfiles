{
  description = "Shaamallow's Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # Hardware optimization
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nixos-hardware,
      ...
    }:
    {
      nixosConfigurations = {
        nixmaster = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixos/configuration.nix
            nixos-hardware.nixosModules.framework-13th-gen-intel
          ];
        };
      };
    };
}
