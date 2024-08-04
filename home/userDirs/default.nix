{ config, ... }:

{
	xdg.userDirs = {
		enable = true;
		desktop = null;
		download = "${config.home.homeDirectory}/downloads";
		documents = "${config.home.homeDirectory}/documents";
		music = null;
		pictures = "${config.home.homeDirectory}/pictures";
		publicShare = null;
		templates = null;
		videos = "${config.home.homeDirectory}/videos";
	};
}
