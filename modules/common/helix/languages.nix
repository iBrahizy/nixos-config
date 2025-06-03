{ pkgs, ... }:

let
	json = pkgs.formats.json { };
	cspell-config = json.generate "cspell.json" (import ./cspell.nix { });
in
{
	language-server = {
		cspell = {
			command = "cspell-lsp";
			args = [ "--stdio" "--config" "${ cspell-config }" ];
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
			language-servers = [ "cspell" ];
		}
	];
}
