{ lib, config, ... }:

{
	services.openssh = {
		enable = true;
		settings = {
			PasswordAuthentication = false;
			PermitRootLogin = "no";
		};
	};

	users.users."ibrahizy".openssh.authorizedKeys.keyFiles = [
		./authorized_keys
	];
}
