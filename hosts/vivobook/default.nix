{ pkgs, modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
		/${modules}/dev
		/${modules}/uni
	];

	powerManagement.enable = true;

	system.stateVersion = "25.11";
	home-manager.users.ibrahizy.home.stateVersion = "25.11";
}
