{
  description = "Shaamallow's Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    # Hardware optimization
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Home Manager getting started
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Overlays
    nur.url = "github:nix-community/nur";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nixos-hardware,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
      overlays = import ./overlays { inherit inputs; };
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      # add devshell here later
      nixosConfigurations = {
        nixmaster = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs overlays; };
          modules = [
            ./nixos/configuration.nix
            nixos-hardware.nixosModules.framework-13th-gen-intel
          ];
        };
      };
      homeConfigurations = {
        "shaamallow@nixmaster" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
            overlays = overlays.unstable;
          };
          extraSpecialArgs = {
            inherit inputs outputs overlays;
            stable-pkgs = import nixpkgs-stable {
              system = "x86_64-linux";
              config.allowUnfree = true;
              overlays = overlays.stable;
            };
            system = "x86_64-linux";
            darwin = false;
          };
          modules = [ ./home-manager/shaamallow.nix ];
        };

        "eyalb@bobby" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
            overlays = overlays.unstable;
          };
          extraSpecialArgs = {
            inherit inputs outputs overlays;
            stable-pkgs = import nixpkgs-stable {
              system = "x86_64-linux";
              config.allowUnfree = true;
              overlays = overlays.stable;
            };
            system = "x86_64-linux";
            darwin = false;
          };
          modules = [ ./home-manager/eyalb.nix ];
        };
      };
    };

}
