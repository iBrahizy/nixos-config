{ pkgs, config, ... }:

{
	home-manager.users.${config.user} = {
		programs.helix = {
			enable = true;
			defaultEditor = true;

			package = (pkgs.unstable.helix.overrideAttrs (_: {
				patches = [
					./inline-diagnostic-timeout.patch
					(pkgs.fetchpatch {
						name = "file-explorer";
						url = "https://patch-diff.githubusercontent.com/raw/helix-editor/helix/pull/11285.diff";
						sha256 = "sha256-zFtUUW/I0WF7RiCfiTxT4RUndR+4ix3kAgyJFYw74+I=";
					})
				];
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
