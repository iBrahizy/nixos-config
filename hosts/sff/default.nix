{ modules, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/gaming
		/${modules}/desktop
		/${modules}/dev
	];

	boot.kernelPackages = pkgs.linuxPackages_latest;

	boot.supportedFilesystems = [ "ntfs" ];

	# Static ip
	networking = {
		interfaces.eno1.ipv4.addresses = [{
			address = "192.168.1.127";
			prefixLength = 24;
		}];

		defaultGateway = "192.168.1.254";
		nameservers = [ "8.8.8.8" ];     

		firewall = {
			allowedTCPPorts = [ 24872 ];
			allowedUDPPorts = [ 24872 ];
		};
	};

	services.openssh.ports = [ 5032 ];

	# wooting udev rules
	services.udev.extraRules = ''
		# Wooting One Legacy
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
		SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
		# Wooting One update mode 
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"
		# Wooting Two Legacy
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
		SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
		# Wooting Two update mode  
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", TAG+="uaccess"
		# Generic Wootings
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
		SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
	'';

	services.picom.enable = true;
	services.picom.settings = {
		vsync = false;
		backend = "glx";  # Use 'glx' if you find tearing persists.
		sw-opti = true;  # Enable software-optimized rendering.
		use-damage = true;  # Only repaint damaged areas for lower overhead.
	};

	services.flatpak.enable = true;
	environment.defaultPackages = with pkgs; [ chromium dolphin-emu ]; # for wootingly

	# version nix was originally installed on
	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
