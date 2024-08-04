{ pkgs, ... }:

{
	gtk.enable = true;

	home.pointerCursor = {
		package = pkgs.apple-cursor;
		gtk.enable = true;
		x11.enable = true;
		name = "macOS-BigSur";
		size = 24;
	};
}
