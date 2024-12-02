{ flakeRoot, pkgs, ... }:

{
	environment.defaultPackages = [
		pkgs.unstable.lumafly # The stable package has a vunrable version of dotnet lol
		pkgs.unstable.r2modman
		(pkgs.callPackage /${flakeRoot}/packages/osu-lazer-bin.nix {})
	];
}
