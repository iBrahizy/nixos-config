{ pkgs, config, lib, flakeRoot, ... }:

let
	toml = pkgs.formats.toml { };
	helixConfig = toml.generate "config.toml" (import ./config.nix { });
	helixLanguages = toml.generate "languages.toml" (import ./languages.nix { inherit pkgs; inherit flakeRoot; });

	helix = (pkgs.unstable.helix.overrideAttrs (_: {
		patches = [
			./inline-diagnostic-timeout.patch
			(pkgs.fetchpatch {
				name = "file-explorer";
				url = "https://patch-diff.githubusercontent.com/raw/helix-editor/helix/pull/11285.diff";
				sha256 = "sha256-zFtUUW/I0WF7RiCfiTxT4RUndR+4ix3kAgyJFYw74+I=";
			})
			(pkgs.fetchpatch {
				name = "rename-browser-to-explorer";
				url = "https://github.com/helix-editor/helix/commit/d4ade409834909c6807a337054022cd6de1ef219.diff";
				sha256 = "sha256-0BjnX9JmQ2UDIOlsC7nf3cQ/a+ZLVSM8S7dMPqfuK6g=";
			})
		];
	}));

	helix-plugin = (pkgs.helix-plugin.helix.overrideAttrs (oldAttrs: {
		postInstall = oldAttrs.postInstall + "mv $out/bin/hx $out/bin/hxp";
		patches = [
			./inline-diagnostic-timeout.patch
		];
	}));

	baseConfig = {
		home-manager.users.${config.user} = {
			programs.helix = {
				enable = true;
				defaultEditor = true;

				package = helix;
			};

			home.file.".config/helix/config.toml".source = helixConfig;
			home.file.".config/helix/languages.toml".source = helixLanguages;
			home.file.".config/helix/themes/catppuccin.toml".source = ./catppuccin.toml;
		};

		environment.sessionVariables = {
			EDITOR = "hx";
			VISUAL = "hx";
		};
	};

	pluginConfig = {
		environment.defaultPackages = [
			helix-plugin	
		];
	};
in
{
	options.modules.helix-plugin.enable = lib.mkOption {
		default = false;
		type = lib.types.bool;
	};

	config = lib.mkMerge [
		(lib.mkIf config.modules.helix-plugin.enable (baseConfig // pluginConfig))
		(lib.mkIf (!config.modules.helix-plugin.enable) baseConfig)
	];
}
