# I do not need steam on all devices

{ config, lib, ... }:

{
	options.modules.steam = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable steam";
		};
	};

	config = lib.mkIf config.modules.steam.enable {
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
			localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
		};
	};
}
