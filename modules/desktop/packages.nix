{ pkgs, ... }:

{
	environment.defaultPackages = with pkgs; [ 
		unstable.qbittorrent # stable version has a security issue right now
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
		zathura
	];
}
