{ pkgs, ... }:

{
	imports = [
		./fish
		./nvim
		./starship
	];

	home-manager.backupFileExtension = "backup";

	home-manager.users.ibrahizy = {
		home.stateVersion = "24.05";
	};

	# home-manager.users.ibrahizy.home.file.".config/nvim".source = ./nvim;
}
