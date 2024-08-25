# I have the exact same configuration for ssh between devices, apart from port
# the motivation behind the module is so that i can keep that configuration but change the port

{ lib, config, ... }:

let
	cfg = config.modules.ssh;
in 
{
	options.modules.ssh = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable custom SSH configuration.";
		};

		port = lib.mkOption {
			type = lib.types.int;
			default = 22;
			description = "The port that SSH should listen on.";
		};
	};

	config = lib.mkIf cfg.enable {
		services.openssh = {
			enable = true;
			ports = [ cfg.port ];
			settings = {
				PasswordAuthentication = false;
				PermitRootLogin = "no";
			};
		};
	};
}

