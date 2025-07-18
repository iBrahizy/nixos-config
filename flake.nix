{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		rust-overlay = {
			url = "github:oxalica/rust-overlay";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		helix-plugin = {
			url = "github:mattwparas/helix";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.rust-overlay.follows = "rust-overlay";
		};
	};

	outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, helix-plugin, ... }:
	let
		system = "x86_64-linux";

		unstable-overlay = final: prev: {
			unstable = import nixpkgs-unstable {
				inherit system;
				config.allowUnfree = true;
			};
		};

		helix-overlay = final: prev: {
			helix-plugin.helix = helix-plugin.packages.${system}.default;
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
				{
					networking.hostName = hostname;

					home-manager = {
						useGlobalPkgs = true;
						backupFileExtension = "backup";
					};
				}
				# Overlays-module makes "pkgs.unstable" available in configuration.nix
				({ ... }: { nixpkgs.overlays = [ unstable-overlay helix-overlay ]; })
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
