# Adapted from https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/os/osu-lazer-bin/package.nix

{ lib
, fetchurl
, appimageTools
, makeWrapper
}:

let
	pname = "osu-lazer-bin";
	version = "2024.1219.2";

	src = fetchurl {
		url = "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
		hash = "sha256-qNkuiDA4LiWqwpYFrBDvV5VoOwO6Ei8jHGIgVKSErdo=";
	};

	meta = {
		description = "Rhythm is just a *click* away (AppImage version for score submission and multiplayer, and binary distribution for Darwin systems)";
		homepage = "https://osu.ppy.sh";
		license = with lib.licenses; [
			mit
			cc-by-nc-40
			unfreeRedistributable # osu-framework contains libbass.so in repository
		];
		sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
		mainProgram = "osu!";
		platforms = [ "x86_64-linux" ];
	};

	passthru.updateScript = ./update-bin.sh;
in
appimageTools.wrapType2 {
	inherit pname version src meta passthru;

	extraPkgs = pkgs: with pkgs; [ icu ];

	extraInstallCommands =
	let
		contents = appimageTools.extract { inherit pname version src; };
	in
	''
		. ${makeWrapper}/nix-support/setup-hook
		mv -v $out/bin/${pname} $out/bin/osu!
		wrapProgram $out/bin/osu! \
		--set OSU_EXTERNAL_UPDATE_PROVIDER 1
		install -m 444 -D ${contents}/osu!.desktop -t $out/share/applications
		for i in 16 32 48 64 96 128 256 512 1024; do
		install -D ${contents}/osu.png $out/share/icons/hicolor/''${i}x$i/apps/osu.png
		done
	'';
}
