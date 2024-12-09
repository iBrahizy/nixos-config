{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [
		jetbrains.idea-ultimate 
		jdk17
		gradle
		postman
		jdt-language-server
	];

	environment.sessionVariables = {
		JAVA_HOME = "${pkgs.jdk17}";
	};
}
