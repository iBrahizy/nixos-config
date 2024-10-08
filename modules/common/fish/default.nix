{ config, ... }:

{
	home-manager.users.${config.user}.programs.fish = {
		enable = true;
		interactiveShellInit = builtins.readFile ./interactive.fish;

		shellAliases = {
			ls = "lsd";
			nix-shell = "nix-shell --command fish";
		};
	};
}
