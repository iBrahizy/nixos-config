{ config, modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
		/${modules}/dev
		/${modules}/uni
	];

	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.graphics.enable = true;
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		open = true;
		nvidiaSettings = false;
		package = config.boot.kernelPackages.nvidiaPackages.beta;
	};

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
