{ pkgs, ... }:

{
	fonts.packages = with pkgs; [
		nerd-fonts.fantasque-sans-mono
		source-sans-pro
		source-sans
		roboto
		font-awesome
	];
}
