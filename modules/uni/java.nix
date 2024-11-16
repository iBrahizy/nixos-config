{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		jetbrains.idea-ultimate 
		jdk
		gradle
		postman
	];
}
