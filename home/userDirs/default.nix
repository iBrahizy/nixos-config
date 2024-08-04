{ config, ... }:

{
	xdg.userDirs = {
		enable = true;
		desktop = null;
		download = "${config.home.homeDirectory}/downloads";
		documents = null;
		music = null;
		pictures = "${config.home.homeDirectory}/pictures";
		publicShare = null;
		templates = null;
		videos = null;
	};
}
