{ ... }:

{
	home-manager.users.ibrahizy = {
		programs.starship = {
			enable = true;

			settings = {
				add_newline = true;

				format = "$nix_shell$git_branch$directory$character";

				character = {
					format = "$symbol ";
					success_symbol = "[:\\)](white)";
					error_symbol = "[:\\(](white)";
					vimcmd_symbol = "[vi](white)";
					vimcmd_replace_one_symbol = "[vi](purple)";
					vimcmd_replace_symbol = "[vi](purple)";
					vimcmd_visual_symbol = "[vi](white)";
				};

				git_branch = {
					format = "[$branch]($style) ";
				};

				directory = {
					style = "#89B4FA";
					format = "[$path]($style) ";
				};

				nix_shell = {
					symbol = "sh ";
					format = "[$symbol]($style)";
				};
			};
		};
	};
}
