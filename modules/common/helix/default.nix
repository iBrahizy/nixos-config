{ config, ... }:

let
	readTOML = file: builtins.fromTOML (builtins.readFile file);
	dbg = x: builtins.trace (x) (x);
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
			themes = let
				themes = builtins.attrNames (builtins.readDir ./themes);
				removeFileExtention = fileName: 
					let
						parts = builtins.split "." fileName;
				    in
						builtins.head parts;
			in
				builtins.foldl' (acc: theme:
					acc // {
				      "${removeFileExtention theme}" = readTOML ./themes/${theme};
				    }
				) {} themes;

			# languages = builtins.foldl' (acc: theme:
			# 	acc // {
			#       "${builtins.attrName theme}" = readTOML theme;
			#     }
			# ) {} builtins.readDir ./themes;
		};
	};
}
