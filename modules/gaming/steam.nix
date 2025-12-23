{ pkgs, ... }:

{
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;

		extraCompatPackages = with pkgs; [
			unstable.proton-ge-bin
		];
	};

	environment.defaultPackages = with pkgs; [ 
		gamemode # used in some steam launch options 
		protontricks
	];
}
