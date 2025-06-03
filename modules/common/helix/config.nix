{ ... }:

{
	# theme = "catppuccin_mocha";
	theme = "catppuccin";

	editor = {
		auto-format = false;
		color-modes = true;
		completion-timeout = 20;
		completion-trigger-len = 1;
		cursorline = true;
		idle-timeout = 20;
		popup-border = "all";
		true-color = true;
		shell = ["fish" "-c"];
		soft-wrap.enable = true;

		cursor-shape = {
			insert = "bar";
		};

		gutters = {
			layout = ["diagnostics" "spacer" "line-numbers" "spacer"];
		};

		indent-guides = {
			render = true;
		};

		statusline = {
			left = ["mode" "separator" "version-control" "file-name" "file-modification-indicator" "read-only-indicator"];
			center = [];
			right = ["spinner" "separator" "diagnostics" "selections" "register" "position" "file-encoding"];
			separator = " ";
		};

		inline-diagnostics = {
			cursor-line = "hint";
			other-lines = "disable";
		};
	};

	keys = {
		normal = {
			"0" = "goto_line_start";
			"G" = "goto_last_line";
			"+" = "format_selections";
			"=" = ":format";
			"D" = ["collapse_selection" "extend_to_line_end" "delete_selection"];
			"C" = ["collapse_selection" "extend_to_line_end" "change_selection"];
			"L" = ["collapse_selection" "extend_to_line_end"]; 
			"H" = ["collapse_selection" "extend_to_line_start"]; 
			"x" = ["goto_line_start" "select_mode" "goto_line_end_newline"];
			"X" = ["goto_line_start" "select_mode" "goto_line_end_newline"];
			"{" = "goto_prev_paragraph";
			"}" = "goto_next_paragraph";
			"Y" = "yank_joined";
			"A-e" = "move_next_sub_word_end";
			"A-w" = "move_next_sub_word_start";
			"A-b" = "move_prev_sub_word_start";
			"K" = "hover";
			"C-k" = "keep_selections";
			"A-c" = "copy_selection_on_next_line";

			space = {
				"f" = "file_picker_in_current_directory";
				"F" = "file_picker";
				"w" = ":w";
				"k" = "no_op";
				"e" = "file_browser_in_current_buffer_directory";
			};
		};

		select = {
			"X" = "select_line_above";
			"{" = "goto_prev_paragraph";
			"}" = "goto_next_paragraph";
			"L" = "extend_to_line_end";
			"H" = "extend_to_line_start";
			"C-k" = "keep_selections";
			"K" = "no_op";
			"G" = "goto_last_line";
		};

		insert = {
			"C-space" = "completion";
		};
	};
}
