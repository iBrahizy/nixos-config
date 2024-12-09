{ lib, ... }:

{
	imports = [
		./sddm.nix
		./gdm.nix
		./ly.nix
	];

	options.modules.display-manager = lib.mkOption {
		default = "sddm";
		type = lib.types.enum [ "sddm" "gdm" "ly" ];
	};
}
