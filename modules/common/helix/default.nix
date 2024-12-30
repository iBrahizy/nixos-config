{ config, ... }:

let
	readTOML = file: builtins.fromTOML (builtins.readFile file);
in
{
	home-manager.users.${config.user} = {
		programs.helix = {
			enable = true;

			settings = readTOML ./config.toml;

			languages = {
				language = [
					{
						name = "nix";
						indent = { tab-width = 4; unit = "\t"; };
					}
					{
						name = "rust";
						indent = { tab-width = 4; unit = "\t"; };
					}
					{
						name = "ruby";
						indent = { tab-width = 2; unit = " "; };
					}
				];
			};

			# Reads all themes in ./themes
			themes = builtins.foldl' (acc: theme:
				acc // {
			      "${builtins.attrName theme}" = readTOML theme;
			    }
			) {} (builtins.readDir ./themes);

			# languages = builtins.foldl' (acc: theme:
			# 	acc // {
			#       "${builtins.attrName theme}" = readTOML theme;
			#     }
			# ) {} builtins.readDir ./themes;
		};
	};
}
