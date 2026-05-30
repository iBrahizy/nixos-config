{ modules, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./liquidctl.nix
		/${modules}/gaming
		/${modules}/desktop
		/${modules}/dev
		/${modules}/uni
	];

	# boot.kernelPackages = pkgs.linuxPackages_latest;

	modules.tablet.enable = true;
	modules.helix-plugin.enable = false;
	modules.csgo.enable = true;

	boot.supportedFilesystems = [ "ntfs" ];

	# Static ip
	# networking = {
	# 	interfaces.eno1.ipv4.addresses = [{
	# 		address = "192.168.1.127";
	# 		prefixLength = 24;
	# 	}];
	#
	# 	defaultGateway = "192.168.1.254";
	# 	nameservers = [ "8.8.8.8" ];     
	#
	# 	firewall = {
	# 		allowedTCPPorts = [ 24872 ];
	# 		allowedUDPPorts = [ 24872 ];
	# 	};
	# };

	services.openssh.ports = [ 5032 ];

 	hardware.wooting.enable = true;

	# services.flatpak.enable = true;
	environment.defaultPackages = with pkgs; [ chromium dolphin-emu openrazer-daemon razergenie polychromatic ]; # for wootingly

	hardware.openrazer.enable = true;

	# version nix was originally installed on
	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";

	boot.initrd.kernelModules = [ "cryptd" ]; # add cryptd
	boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-label/NIXLUKS";

	boot.kernelParams = [
		"nvme_core.default_ps_max_latency_us=0"
		"pcie_aspm=off"
		"pcie_port_pm=off"
	];
}
