{ ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	boot.supportedFilesystems = [ "ntfs" ];

	networking.hostName = "gaming";

	# Mount windows drive
	fileSystems."/mnt/win11" = {
		device = "/dev/sda3";
		fsType = "ntfs-3g";
		options = [ "rw" "uid=0" ];
	};

	# Static ip
	networking = {
		interfaces.eno1.ipv4.addresses = [{
			address = "192.168.1.127";
			prefixLength = 24;
		}];

		defaultGateway = "192.168.1.254";
		nameservers = [ "8.8.8.8" ];     
	};

	services.openssh = {
		enable = true;
		ports = [ 5032 ];
		settings.PasswordAuthentication = false;
	};

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
}
