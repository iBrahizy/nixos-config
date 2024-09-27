{ pkgs, ... }:

{
	programs.river.enable = true;

	environment.defaultPackages = with pkgs; [
		slurp
		libinput
		river
		wofi
		wlr-randr
		wl-clipboard
		waybar
	];
}
