{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      ...
    }:
    {
      nixosConfigurations.nixmaster = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/configuration.nix ];
      };
    };
}
