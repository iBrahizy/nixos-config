{ lib, config, pkgs, ... }:

{
	options.user = lib.mkOption {
		default = "ibrahizy";
		description = "main user";
	};

	config = {
		users.users.${config.user} = {
			# home-manager provides fish
			ignoreShellProgramCheck = true;
			shell = pkgs.fish;
			isNormalUser = true;
			description = config.user;
			extraGroups = [ "networkmanager" "wheel" "libvirtd" "proc" ];
		};

		home-manager.users.${config.user}.xdg.userDirs = 
			let 
				homeDir = config.home-manager.users.${config.user}.home.homeDirectory;
			in {
			enable = true;
			# I wanted to keep desktop null but it seems to always create one for me even when i delete it
			desktop = "${homeDir}/desktop";
			download = "${homeDir}/downloads";
			documents = "${homeDir}/documents";
			music = null;
			pictures = "${homeDir}/pictures";
			publicShare = null;
			templates = null;
			videos = "${homeDir}/videos";
		};
	};
}
