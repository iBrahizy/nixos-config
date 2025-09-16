{ flakeRoot, pkgs, ... }:

{
	environment.defaultPackages = [
		pkgs.unstable.lumafly # The stable package has a vunerable version of dotnet lol
		pkgs.unstable.r2modman
		(pkgs.callPackage /${flakeRoot}/packages/osu-lazer-bin/package.nix { })
		pkgs.pokemmo-installer
	];
}
