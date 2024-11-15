{ lib, pkgs, config, ... }:

{
	options.modules.uniJava = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};
	};

	config = lib.mkIf (config.modules.uniJava.enable == true) {
		environment.defaultPackages = with pkgs; [
			jetbrains.idea-ultimate 
			jdk
			gradle
			postman

			# technically not just "java" hopefully here temporarily 
			openfortivpn
		];
	};
}
