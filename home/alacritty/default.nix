{ ... }:

{
	programs.alacritty.enable = true; 
	programs.alacritty.settings = {
		font = {
			size = 16;
			normal = { family = "FantasqueSansM Nerd Font"; style = "Regular"; };
			bold = { family = "FantasqueSansM Nerd Font"; style = "Bold"; };
			italic = { family = "FantasqueSansM Nerd Font"; style = "Italic"; };
			bold_italic = { family = "FantasqueSansM Nerd Font"; style = "Bold Italic" };
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
