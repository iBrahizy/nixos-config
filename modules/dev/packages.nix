{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		gcc
		# python3
		# python312Packages.python-lsp-server
		(python312.withPackages (ps: with ps; [
			python-lsp-server
			numpy
			scipy
			jupyterlab
			pandas
			statsmodels
			scikit-learn
			pytest
			pypdf
		]))
		rustup
		ghc
		haskell-language-server
		cabal-install
		graphviz
	];
}
