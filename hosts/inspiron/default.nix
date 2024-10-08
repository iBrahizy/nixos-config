{ modules, config, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/gaming
		/${modules}/desktop
		/${modules}/dev
	];

	modules.display-manager = "gdm";
	modules.uniJava.enable = true;

	# Blacklisting nvidia, relying on the igpu
	boot.extraModprobeConfig = ''
		blacklist nouveau
		options nouveau modeset=0
	'';
  
	services.udev.extraRules = ''
		# Remove NVIDIA USB xHCI Host Controller devices, if present
		ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
		# Remove NVIDIA USB Type-C UCSI devices, if present
		ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
		# Remove NVIDIA Audio devices, if present
		ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
		# Remove NVIDIA VGA/3D controller devices
		ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
	'';
	boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];

	# This did work, as much as nvidia will work... 
	# Expected performance in games but choppy performance for normaly use
	# hardware.opengl.enable = true;
	# services.xserver.videoDrivers = [ "nvidia" ];
	# boot.initrd.kernelModules = [ "nvidia" ];
	# boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
	#
	# hardware.nvidia = {
	# 	# Modesetting is required.
	# 	modesetting.enable = true;
	# 	open = false;
	# 	nvidiaSettings = true;
	# 	package = config.boot.kernelPackages.nvidiaPackages.stable;
	# };
	#
	# hardware.nvidia.prime = {
	# 	sync.enable = true;
	#
	# 	intelBusId = "PCI:0:2:0";
	# 	nvidiaBusId = "PCI:1:0:0";
	# };

	# version nix was originally installed on
	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
