{ pkgs, ... }:

{
	programs.river.enable = true;

	environment.defaultPackages = with pkgs; [
		wl-color-picker
		slurp
		libinput
		river
		wofi
		wlr-randr
		wl-clipboard
		waybar
	];
}
