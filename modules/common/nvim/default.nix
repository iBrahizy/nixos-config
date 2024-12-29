{ config, pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		lua-language-server
	];

	home-manager.users.${config.user} = {
		programs.neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			defaultEditor = true;

			package = pkgs.unstable.neovim-unwrapped;
		};

		home.file.".config/nvim".source = ./.;
	};

	environment.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};
}
