{ pkgs, lib, config, ... }:

let
	cfg = config.modules.torrenting;
in
{
	options.modules.torrenting = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Include some programs used for torrenting";
		};
	};

	config = lib.mkIf cfg.enable {
		environment.defaultPackages = with pkgs; [
			qbittorrent
			tor-browser # this is incredibly overkill, but I don't have a vpn/proxy and some sites are blocked by isp
		];
	};
}

