{ config, ... }:

{
	home-manager.users.${config.user} = {
	programs.helix = {
		enable = true;

		settings = {
			theme = "catppuccin_mocha";

			editor = {
				idle-timeout = 20;
				completion-timeout = 20;
				completion-trigger-len = 1;

				indent-guides = {
					render = true;
				};

				cursor-shape = {
					insert = "bar";
				};

				gutters = {
					layout = [ "diagnostics" "spacer" "line-numbers" "spacer" ];
				};
			};

			keys = {
				normal = {
					"0" = "goto_line_start";
					D = [ "collapse_selection" "select_mode" "goto_line_end" "delete_selection" ];
				};
			};
		};

		languages = {
			language = [{
			name = "nix";
			indent = { tab-width = 4; unit = "\t"; };
			}];
		};
	};
	};
}
