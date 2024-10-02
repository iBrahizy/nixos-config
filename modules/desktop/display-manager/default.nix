{ lib, ... }:

{
	imports = [
		./sddm.nix
		./gdm.nix
	];

	options.modules.display-manager = lib.mkOption {
		default = "sddm";
		type = lib.types.enum [ "sddm" "gdm" ];
	};
}
