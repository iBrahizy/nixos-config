{ pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;

		package = pkgs.unstable.neovim-unwrapped;
	};

	home.file.".config/nvim".source = ./.;
}
