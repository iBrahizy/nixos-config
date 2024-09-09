# I do not want games on all devices

{ config, lib, pkgs, ... }:

{
	options.modules.gaming = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable gaming";
		};
	};

	config = lib.mkIf config.modules.gaming.enable {
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
			localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
		};

		environment.defaultPackages = with pkgs; [ 
			unstable.osu-lazer-bin 
			gamemode # For civ 6 to work this is needed for some reason
		];
	};
}
