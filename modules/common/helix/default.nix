{ pkgs, config, ... }:

{
	home-manager.users.${config.user} = {
		programs.helix = {
			enable = true;
			defaultEditor = true;

			package = (pkgs.unstable.helix.overrideAttrs (_: {
				patches = [ ./inline-diagnostic-timeout.patch ];
			}));
		};

		home.file.".config/helix".source = ./.;
		# home.file.".config/helix".source = config.home-manager.users.${config.user}.lib.file.mkOutOfStoreSymlink ./.;
	};

	environment.sessionVariables = {
		EDITOR = "hx";
		VISUAL = "hx";
	};
}
