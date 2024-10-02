{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		gcc
		python3
		python312Packages.python-lsp-server
		rustup
		ghc
		haskell-language-server
	];
}
