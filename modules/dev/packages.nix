{ pkgs, ... }:

{
	# Known python docs issue in 26.05, known work around
	documentation.doc.enable = false;
	
	environment.defaultPackages = with pkgs; [
		gcc
		# python3
		# python312Packages.python-lsp-server
		(python312.withPackages (ps: with ps; [
			python-lsp-server
			numpy
			scipy
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
