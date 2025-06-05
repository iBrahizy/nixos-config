{ pkgs, config, flakeRoot, ... }:

let
	toml = pkgs.formats.toml { };
	helixConfig = toml.generate "config.toml" (import ./config.nix { });
	helixLanguages = toml.generate "languages.toml" (import ./languages.nix { inherit pkgs; inherit flakeRoot; });
in
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

		home.file.".config/helix/config.toml".source = helixConfig;
		home.file.".config/helix/languages.toml".source = helixLanguages;
		home.file.".config/helix/themes/catppuccin.toml".source = ./catppuccin.toml;
	};

	environment.sessionVariables = {
		EDITOR = "hx";
		VISUAL = "hx";
	};
}
