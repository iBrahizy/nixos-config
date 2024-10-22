{ pkgs, ... }:

{
	programs.river.enable = true;

	environment.defaultPackages = with pkgs; [
		wl-color-picker
		slurp
		wayshot
		libinput
		river
		wofi
		wlr-randr
		wl-clipboard
		waybar
	];
}
