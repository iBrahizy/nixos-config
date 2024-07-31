{ ... }:

{
	imports = [
		./fish
		./nvim
		./starship
		./git
		./theming
	];

	home-manager.backupFileExtension = "backup";

	home-manager.users.ibrahizy = {
		home.stateVersion = "24.05";
	};
}
