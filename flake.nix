{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ...}:
	let
		system = "x86_64-linux";
		overlay-unstable = final: prev: {
			unstable = import nixpkgs-unstable {
				inherit system;
				config.allowUnfree = true;
			};
		};

		createConfig = hostname: nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; };

			modules = [
				./modules
				inputs.home-manager.nixosModules.default
				{
					networking.hostName = hostname;

					home-manager = {
						useGlobalPkgs = true;
						backupFileExtension = "backup";

						extraSpecialArgs = {
							inherit inputs;
						};

						users.ibrahizy = import ./home;
						users.root = import ./home;
					};
				}
				# Overlays-module makes "pkgs.unstable" available in configuration.nix
				({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
				./configuration.nix
				./hosts/${hostname}
			];
		};
	in 
	{
		nixosConfigurations.sff = createConfig "sff";
		nixosConfigurations.inspiron = createConfig "inspiron";
	};
}
