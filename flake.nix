{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	disko = {
      url = "github:nix-community/disko";
	  inputs.nixpkgs.follows = "nixpkgs";
	};
	home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
	  inputs.nixpkgs.follows = "nixpkgs";
	};
    hardware-config.url = "path:/home/niwan/nixos-hardware";
  };

  outputs =
    {
      nixpkgs,
	  hardware-config,
      home-manager,
      disko,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          hardware-config.nixosModules.hardware

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.niwan = import ./home.nix;
          }
        ];
      };

	  # for nixos-anywhere
      nixosConfigurations.generic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./nixos-anywhere/hardware-configuration.nix

          disko.nixosModules.disko
          ./nixos-anywhere/disko.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.niwan = import ./home.nix;
          }
        ];
      };
    };
}
