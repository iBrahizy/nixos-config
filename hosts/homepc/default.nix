{ config, modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
		/${modules}/dev
		/${modules}/uni
	];

	# Mount windows drive
	fileSystems."/mnt/win11" = {
		device = "/dev/sda3";
		fsType = "ntfs-3g";
		options = [ "rw" "uid=0" ];
	};
	
	hardware.opengl.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	# Thanks https://github.com/TLATER/dotfiles/blob/f4ed53e9e78ff41cd2849f389499d3bfd3ffe4c7/nixos-config/hosts/yui/nvidia/default.nix#L12
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		open = false;

		# The nvidia-settings build is currently broken due to a missing
		# vulkan header; re-enable whenever
		# 0384602eac8bc57add3227688ec242667df3ffe3the hits stable.
		nvidiaSettings = false;

		package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
			version = "560.35.03";
			sha256_64bit = "sha256-8pMskvrdQ8WyNBvkU/xPc/CtcYXCa7ekP73oGuKfH+M=";
			sha256_aarch64 = "sha256-s8ZAVKvRNXpjxRYqM3E5oss5FdqW+tv1qQC2pDjfG+s=";
			openSha256 = "sha256-/32Zf0dKrofTmPZ3Ratw4vDM7B+OgpC4p7s+RHUjCrg=";
			settingsSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
			persistencedSha256 = "sha256-E2J2wYYyRu7Kc3MMZz/8ZIemcZg68rkzvqEwFAL3fFs=";
		};
	};

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
