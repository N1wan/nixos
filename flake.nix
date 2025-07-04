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
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix

          disko.nixosModules.disko
          ./disko.nix

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
