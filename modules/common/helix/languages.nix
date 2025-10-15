{ pkgs, flakeRoot, ... }:

let
	json = pkgs.formats.json { };
	cspell-config = json.generate "cspell.json" (import ./cspell.nix { });
	init-script = pkgs.writeTextFile rec {
		name = "init.fish";
		executable = true;
		destination = "/bin/${name}";
		text = ''
            #!${pkgs.fish}/bin/fish
            
            if path is .git
                if not path is cspell.json
                    cat ${cspell-config} > cspell.json
                end
                exec ${(pkgs.callPackage /${flakeRoot}/packages/cspell-lsp.nix { })}/bin/cspell-lsp --stdio --config ./cspell.json
            else
                exec ${(pkgs.callPackage /${flakeRoot}/packages/cspell-lsp.nix { })}/bin/cspell-lsp --stdio --config ${cspell-config}
            end
            
            '';
	};
in
{
	language-server = {
		# Creates a cspell.json if we are in a git directory, or uses the one thats present
		# If we aren't in a git directory it will use the default one
		cspell = {
			command = "${init-script}/bin/init.fish";
		};
		jdtls = {
			command = "jdtls";
			config.java.project.referencedLibraries = [
				"${pkgs.jogl}/share/java/*"
			];
			
		};
	};

	language = [
		{
			name = "nix";
			indent = {
				tab-width = 4;
				unit = "\t";
			};
		}

		{
			name = "rust";
			indent = {
				tab-width = 4;
				unit = "\t";
			};
		}
		
		{
			name = "ruby";
			indent = {
				tab-width = 2;
				unit = "  ";
			};
		}
		
		{
			name = "markdown";
			indent = {
				tab-width = 4;
				unit = "    ";
			};
			language-servers = [ "cspell" "marksman" ];
		}

		{
			name = "typst";
			indent = {
				tab-width = 4;
				unit = "    ";
			};
			language-servers = [ "cspell" "tinymist" ];
		}

		{
			name = "java";
			indent = {
				tab-width = 2;
				unit = "  ";
			};
			language-servers = [ "jdtls" ];
		}
	];
}
