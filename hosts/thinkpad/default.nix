{ ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	# version nix was originally installed on
	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
