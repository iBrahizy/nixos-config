{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs = {
				nixpkgs.follows = "nixpkgs-unstable";
				home-manager.follows = "home-manager";

				devshell.follows = "";
				flake-compat.follows = "";
				git-hooks.follows = "";
				nix-darwin.follows = "";
				treefmt-nix.follows = "";
			};
		};
	};

	outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ... }:
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
			specialArgs = { 
				inherit inputs; 
				modules = ./modules;
				flakeRoot = ./.;
			};

			modules = [
				inputs.home-manager.nixosModules.default
				inputs.nixvim.nixosModules.nixvim
				{
					networking.hostName = hostname;

					home-manager = {
						useGlobalPkgs = true;
						backupFileExtension = "backup";
					};
				}
				# Overlays-module makes "pkgs.unstable" available in configuration.nix
				({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
				./configuration.nix
				./hosts/${hostname}
				./modules/common
			];
		};
	in 
	{
		# Creates hosts based on the ./hosts directory
		nixosConfigurations = let
			hostsDir = ./hosts;
			hosts = builtins.attrNames (builtins.readDir hostsDir);
		in
			builtins.listToAttrs (map (host: { name = host; value = createConfig host; }) hosts);
	};
}
