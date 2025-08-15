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
    }@inputs:
    let
      # Supported systems
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      inheritArgs = {
        inherit
          forAllSystems
          inputs
          nixos-hardware
          nixpkgs
          nixpkgs-stable
          ;
      };
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
      # add Overlays here later
      # add devshell here later
      nixosConfigurations = {
        nixmaster = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inheritArgs; };
          modules = [
            ./nixos/configuration.nix
            nixos-hardware.nixosModules.framework-13th-gen-intel
          ];
        };
      };
    };
}
