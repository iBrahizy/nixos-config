{ config, lib, pkgs, ... }:

{
	config = lib.mkIf (config.modules.display-manager == "sddm") {
		environment.defaultPackages = [ 
			(pkgs.where-is-my-sddm-theme.override {
				themeConfig.General = {
					passwordCursorColor = "#FFFFFF";
					backgroundFill = "#1e1e2e";
					passwordTextColor = "#80a0ff";
					cursorBlinkAnimation = false;
				};
			})
		];

		services.displayManager.sddm = {
			enable = true;
			theme = "where_is_my_sddm_theme";
			settings = {
				General = {
					InputMethod = "";
				};
			};
		};
	};
}
