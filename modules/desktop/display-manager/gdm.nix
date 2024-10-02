{ config, lib, ... }:

{
	config = lib.mkIf (config.modules.display-manager == "gdm") {
		services.xserver.displayManager.gdm.enable = true;
	};
}
