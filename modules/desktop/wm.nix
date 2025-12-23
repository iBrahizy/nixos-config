{ pkgs, ... }:

{
	# Configure keymap in X11
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;

	environment.defaultPackages = with pkgs; [
		wl-clipboard
		wl-color-picker # not sure if i care tbh
	];
}
