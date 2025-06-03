{
	pkgs,
}:

pkgs.buildNpmPackage rec {
	name = "cspell-lsp";
	version = "1.1.2";

	src = pkgs.fetchFromGitHub {
		owner = "vlabo";
		repo = "cspell-lsp";
		rev = "v${version}";
		hash = "sha256-lwUeq3edeZNe2BjpLMnuWkMj4W+6urWIgy4GDjajM5M=";
	};

	npmDepsHash = "sha256-mNSmF5Ao7SKynYdm1vhTrXGxgBLCzA9QsTtNY6E6qkA=";
	nativeBuildInputs = [ pkgs.bun ];

	# Ensure the dist/ directory is included
	installPhase = ''
        mkdir -p $out/lib/node_modules/${name}
        cp -r . $out/lib/node_modules/${name}
        
        # Create a symlink to the binary
        mkdir -p $out/bin
        # ln -s $out/lib/node_modules/${name}/dist/cspell-lsp.js $out/bin/cspell-lsp
        ln -s $out/lib/node_modules/${name}/dist/cspell-lsp.js $out/bin/cspell-lsp
	'';

	# dontNpmBuild = true;

	meta = {
		description = "Language server for cspell";
		homepage = "https://github.com/vlabo/cspell-lsp";
		# license = pkgs.lib.licenses.mit;
	};
}
