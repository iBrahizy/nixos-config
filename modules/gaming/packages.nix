{ flakeRoot, pkgs, ... }:

{
	environment.defaultPackages = [
		pkgs.unstable.lumafly # The stable package has a vunrable version of dotnet lol
		(pkgs.callPackage /${flakeRoot}/packages/osu-lazer-bin.nix {})
		pkgs.unstable.r2modman
	];
}
