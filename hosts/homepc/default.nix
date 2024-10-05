{ modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
	];
	
	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
