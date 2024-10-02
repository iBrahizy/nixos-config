{ config, lib, pkgs, ... }:

{
	config = lib.mkIf (config.modules.display-manager == "sddm") {
		environment.defaultPackages = [ pkgs.where-is-my-sddm-theme ];

		services.displayManager.sddm = {
			enable = true;
			theme = "where_is_my_sddm_theme";
			# package = pkgs.kdePackages.sddm;
		};
	};
}
