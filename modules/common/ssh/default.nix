{ config, ... }:

{
	services.openssh = {
		enable = true;
		settings = {
			PasswordAuthentication = false;
			PermitRootLogin = "no";
		};
	};

	users.users."${config.user}".openssh.authorizedKeys.keyFiles = [
		./authorized_keys
	];
}
