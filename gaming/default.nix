{ ... }:

{
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
}
