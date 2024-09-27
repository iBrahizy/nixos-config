{ config, ... }:

{
	xdg.userDirs = {
		enable = true;
		# I wanted to keep desktop null but it seems to always create one for me even when i delete it
		desktop = "${config.home.homeDirectory}/desktop";
		download = "${config.home.homeDirectory}/downloads";
		documents = "${config.home.homeDirectory}/documents";
		music = null;
		pictures = "${config.home.homeDirectory}/pictures";
		publicShare = null;
		templates = null;
		videos = "${config.home.homeDirectory}/videos";
	};
}
