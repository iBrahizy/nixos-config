{ config, lib, pkgs, ... }:

{
	options.modules.tablet.enable = lib.mkOption {
		default = false;
		type = lib.types.bool;
	};

	config = lib.mkIf config.modules.tablet.enable {
		hardware.opentabletdriver = {
			enable = true;
			package = pkgs.unstable.opentabletdriver;
		};
	};
}
