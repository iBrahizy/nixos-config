{ config, ... }:

{
	home-manager.users.${config.user}.programs.btop = {
		enable = true;

		settings = {
			theme_background = false;
			vim_keys = true;
		};
	};
}
