{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [ 
		qbittorrent
		pavucontrol
		feh
		vesktop
		flameshot
		(wrapOBS {
			plugins = with obs-studio-plugins; [
				wlrobs
				obs-backgroundremoval
				obs-pipewire-audio-capture
			];
		})
		vlc
		ani-cli
		firefox
	];
}
