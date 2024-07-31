{ pkgs, ... }:

{
	home-manager.users.ibrahizy.programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;

		package = pkgs.unstable.neovim-unwrapped;
	};

	environment.variables.EDITOR = "nvim";
	environment.variables.VISUAL = "nvim";
	home-manager.users.ibrahizy.home.file.".config/nvim".source = ./.;
}
