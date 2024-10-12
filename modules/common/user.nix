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
		in 
		{
			enable = true;
			desktop = "${homeDir}/other/desktop";
			download = "${homeDir}/downloads";
			documents = "${homeDir}/other/documents";
			music = null;
			pictures = "${homeDir}/images";
			publicShare = "${homeDir}/other/share";
			templates = null;
			videos = "${homeDir}/videos";
		};
	};
}
