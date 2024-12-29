{ pkgs, modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
		/${modules}/dev
		/${modules}/uni
	];

	modules.display-manager = "ly";
	powerManagement.enable = true;

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
