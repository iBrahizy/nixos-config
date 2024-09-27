{ pkgs, ... }:

{
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

	environment.defaultPackages = with pkgs; [ 
		unstable.osu-lazer-bin 
		gamemode # used in some steam launch options (civ 6 in particular)
	];
}
