{ ... }:

{
	home-manager.users.ibrahizy.programs.fish = {
		enable = true;
		interactiveShellInit = builtins.readFile ./config.fish;

		shellAliases = {
			ls = "lsd";
			nix-shell = "nix-shell --command fish";
		};
	};
}
