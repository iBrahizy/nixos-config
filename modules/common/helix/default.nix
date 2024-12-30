{ config, ... }:

{
	home-manager.users.${config.user} = {
	programs.helix = {
		enable = true;

		settings = {
			theme = "my-catppuccin";

			editor = {
				cursorline = true;
				true-color = true;
				idle-timeout = 20;
				completion-timeout = 20;
				completion-trigger-len = 1;
				auto-format = false;
				color-modes = true;
				popup-border = "all";

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
					A-x = "extend_to_line_bounds";
					X = "select_line_above";
					"0" = "goto_line_start";
					D = [ "collapse_selection" "select_mode" "goto_line_end" "delete_selection" ];
					"{" = "goto_prev_paragraph";
					"}" = "goto_next_paragraph";
					"=" = ":format";
					"+" = "format_selections";
				};

				select = {
					A-x = "extend_to_line_bounds";
					X = "select_line_above";
				};
			};
		};

		languages = {
			language = [{
				name = "nix";
				indent = { tab-width = 4; unit = "\t"; };
			}];
		};

		themes.my-catppuccin = builtins.fromTOML (builtins.readFile ./my-catppuccin.toml);
	};
	};
}
