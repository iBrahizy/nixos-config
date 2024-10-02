{ lib, config, ... }:

{
	options.modules.display-manager = lib.mkOption {
		default = "sddm";
		type = lib.types.enum [ "sddm" "gdm" ];
	};

	config = lib.mkIf (config.modules.display-manager == "sddm") {
		services.displayManager.sddm = {
			enable = true;
			theme = "where_is_my_sddm_theme";
			# package = pkgs.kdePackages.sddm;
		};
	} // lib.mkIf (config.modules.display-manager == "gdm") {
		services.displayManager.gdm.enable = true;
	};
}
