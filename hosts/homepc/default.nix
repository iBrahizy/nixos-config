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

		package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
			version = "555.58.02";
			sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
			sha256_aarch64 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
			openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
			settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
			persistencedSha256 = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
		};
	};

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
