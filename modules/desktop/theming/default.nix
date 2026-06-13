{ config, pkgs, ... }:

let 
	custom-catppuccin-gtk = (pkgs.catppuccin-gtk.override { variant = "mocha"; });
in
{
	environment.defaultPackages = [
		custom-catppuccin-gtk

		# Probably don't need this, I'm keeping it because you DO need the above one
		# It's weird that you need one but not the other
		pkgs.catppuccin-cursors
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
			# Not sure if this is the correct behaviour
			theme.name = "catppuccin-mocha-blue-standard";
			theme.package = custom-catppuccin-gtk;

			gtk4.theme.name = "catppuccin-mocha-blue-standard";
			gtk4.theme.package = custom-catppuccin-gtk;
		};	
	};
}

