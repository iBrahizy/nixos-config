{ config, ... }:

{
	home-manager.users.${config.user}.programs.git = {
		enable = true;
		settings = {
			core.editor = "hx";
			user.email = "imahmood1710@gmail.com";
			user.name = "Ibrahim Mahmood-Qureshi";
		};
	};
}
