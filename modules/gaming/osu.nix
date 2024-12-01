{ flakeRoot, pkgs, ... }:

{
	hardware.opentabletdriver = {
		enable = true;
		package = (pkgs.callPackage /${flakeRoot}/packages/open-tablet-driver {});
	};

	environment.defaultPackages = [
		(pkgs.callPackage /${flakeRoot}/packages/osu-lazer-bin.nix {})
	];
}
