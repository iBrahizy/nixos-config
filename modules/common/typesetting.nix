{ pkgs, flakeRoot, ... }:

{
	environment.defaultPackages = with pkgs;[
		marksman
		(pkgs.callPackage /${flakeRoot}/packages/cspell-lsp.nix { })

		typst
		tinymist
	];
}
