{ ... }:

let
	font = "FantasqueSansM Nerd Font";
in
{
	programs.alacritty.enable = true; 
	programs.alacritty.settings = {
		font = {
			size = 16;
			normal = { family = font; style = "Regular"; };
			bold = { family = font; style = "Bold"; };
			italic = { family = font; style = "Italic"; };
			bold_italic = { family = font; style = "Bold Italic"; };
		};

		window = {
			padding = { x = 0; y = 0; };
			dynamic_title = true;
			dynamic_padding = false;
		};

		mouse = {
			hide_when_typing = true;
		};

		colors.primary = {
			background = "#1E1E2E";
		};
	};
}
