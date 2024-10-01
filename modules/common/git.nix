{ config, ... }:

{
	home-manager.users.${config.user}.programs.git = {
		enable = true;
		userEmail = "imahmood1710@gmail.com";
		userName = "ibrahizy";

		extraConfig = {
			core.editor = "nvim";
		};
	};
}