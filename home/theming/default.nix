{ pkgs, ... }:

{
	gtk.enable = true;

	home.pointerCursor = {
		package = pkgs.phinger-cursors;
		gtk.enable = true;
		x11.enable = true;
		name = "phinger-cursors-dark";
		size = 24;
	};
}
