{ lib, config, ... }:

{
	options.modules.virtualisation = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable virtualisation";
		};
	};

	config = lib.mkIf config.modules.virtualisation.enable {
		virtualisation.libvirtd.enable = true;
		programs.virt-manager.enable = true;
	};
}
