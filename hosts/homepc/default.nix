{ config, modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
	];

	# Mount windows drive
	fileSystems."/mnt/win11" = {
		device = "/dev/sda3";
		fsType = "ntfs-3g";
		options = [ "rw" "uid=0" ];
	};
	
	hardware.opengl.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
