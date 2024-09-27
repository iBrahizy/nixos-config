{ pkgs, ... }:

{
	home.pointerCursor = {
		package = pkgs.phinger-cursors;
		gtk.enable = true;
		x11.enable = true;
		name = "phinger-cursors-dark";
		size = 24;
	};

	qt = {
		enable = true;
		style.name = "adwaita-dark";
	};

	gtk = {
		enable = true;
		theme.name = "adwaita-dark";
	};
}
