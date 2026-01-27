{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [ 
		unstable.qbittorrent # stable version has a security issue right now
		pavucontrol
		feh
		vesktop
		obs-studio
		vlc
		firefox
		spotify
	];
}
