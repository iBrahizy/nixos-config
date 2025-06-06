{ pkgs, ... }:

{
	# Configure keymap in X11
	services.xserver = {
		enable = true;
		xkb = {
			layout = "gb";
			variant = "";
		};

		desktopManager.xterm.enable = false;

		windowManager.i3 = {
			enable = true;
			extraPackages = with pkgs; [
				dmenu
				i3status
			];
		};
	};

	services.desktopManager = {
		plasma6.enable = true;
	};

	environment.defaultPackages = with pkgs; [
		xclip
	];
}
