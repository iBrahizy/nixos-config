{ pkgs, config, ... }:

{
	
	home-manager.users.${config.user} = {
		programs.helix= {
			enable = true;
			defaultEditor = true;

			package = pkgs.unstable.helix;
		};

		home.file.".config/helix".source = ./.;
		# home.file.".config/helix".source = config.home-manager.users.${config.user}.lib.file.mkOutOfStoreSymlink ./.;
	};
}
