{ flakeRoot, pkgs, ... }:

{
	environment.defaultPackages = [
		pkgs.lumafly
		(pkgs.callPackage /${flakeRoot}/packages/osu-lazer-bin.nix {})
		pkgs.unstable.r2modman
	];
}
