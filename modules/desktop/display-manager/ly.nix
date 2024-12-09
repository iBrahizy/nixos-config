{ lib, config, ... }:

{
	config = lib.mkIf (config.modules.display-manager == "ly") {
		services.displayManager.ly.enable = true;
	};
}
