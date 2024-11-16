{ pkgs, ...}:

{
	environment.defaultPackages = with pkgs; [
		openfortivpn
	];
}
