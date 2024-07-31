{ pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;

		package = pkgs.unstable.neovim-unwrapped;
	};

	environment.variables.EDITOR = "nvim";
	environment.variables.VISUAL = "nvim";
	file.".config/nvim".source = ./.;
}
