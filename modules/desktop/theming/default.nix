{ config, pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		catppuccin-gtk
		catppuccin-qt5ct
		catppuccin-cursors
	];

	home-manager.users.${config.user} = {
		home.pointerCursor = {
			package = pkgs.catppuccin-cursors.frappeDark;
			gtk.enable = true;
			x11.enable = true;
			name = "catppuccin-frappe-dark-cursors";
			size = 24;
		};

		# This is unideal but qt theming is making me want tod ie
		qt = {
			enable = true;
			style.name = "adwaita-dark";
		};

		gtk = {
			enable = true;
			theme.name = "catppuccin-frappe-blue-standard";
			theme.package = pkgs.catppuccin-gtk;
		};
	};
}

