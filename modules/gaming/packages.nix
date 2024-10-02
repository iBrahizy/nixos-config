{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		unstable.osu-lazer-bin
		lumafly
	];
}
