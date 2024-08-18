{ config, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	hardware.opengl.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];
	boot.initrd.kernelModules = [ "nvidia" ];
	boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

	hardware.nvidia = {
		# Modesetting is required.
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

	hardware.nvidia.prime = {
		sync.enable = true;

		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
	};
}
