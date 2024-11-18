{ modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
		/${modules}/dev
		/${modules}/uni
	];

	powerManagement.enable = true;

	# I haven't really compared performance with ppd vs tlp
	# I mostly just want the stop charging threshhold
	services.power-profiles-daemon.enable = false;
	services.tlp = {
		enable = true;

		settings = {
			# Stop charging at 80%
			STOP_CHARGE_THRESH_BAT0 = 80; 
		};
	};

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
