# Adapted from https://github.com/OpenTabletDriver/OpenTabletDriver/tree/0.6.x (default.nix)
# The normal version of opentabletdriver was not working for me
# The latest git commit on the 0.6.x branch did work for me
# This is just the latest commit at the time which seems to work fine

{ lib
, buildDotnetModule
, fetchFromGitHub
, fetchurl
, gtk3
, libX11
, libXrandr
, libappindicator
, libevdev
, libnotify
, udev
, copyDesktopItems
, makeDesktopItem
, nixosTests
, wrapGAppsHook
, dpkg
, dotnetCorePackages

, strace

, git
, jq
, coreutils
, gawk
, gnused
, bash
}:

buildDotnetModule rec {
	pname = "OpenTabletDriver";
	version = "0.6.4.0";

	src = fetchGit {
	url = "https://github.com/OpenTabletDriver/OpenTabletDriver/";
	rev = "e0856b8aa97cf54f9aca11781e32cc5e32b90314";
	# hash = "sha256-kwZHy0FfOUFIWvyOj0ghlQz05U+Lnzl5TgC4T6bhm7o=";
	};

	dotnet-sdk = dotnetCorePackages.sdk_8_0;
	dotnet-runtime = dotnetCorePackages.runtime_8_0;

	dotnetInstallFlags = [ "--framework=net8.0" ];

	projectFile = [ "OpenTabletDriver.Console" "OpenTabletDriver.Daemon" "OpenTabletDriver.UX.Gtk" ];
	nugetDeps = ./deps.nix;

	executables = [ "OpenTabletDriver.Console" "OpenTabletDriver.Daemon" "OpenTabletDriver.UX.Gtk" ];

	nativeBuildInputs = [
		copyDesktopItems
		wrapGAppsHook
		dpkg
		jq
		coreutils
		gawk
		gnused
		bash
	];

	runtimeDeps = [
		gtk3
		libX11
		libXrandr
		libappindicator
		libevdev
		libnotify
		udev
	];

	buildInputs = runtimeDeps;

	postFixup = ''
		# Give a more "*nix" name to the binaries
		mv $out/bin/OpenTabletDriver.Console $out/bin/otd
		mv $out/bin/OpenTabletDriver.Daemon $out/bin/otd-daemon
		mv $out/bin/OpenTabletDriver.UX.Gtk $out/bin/otd-gui

		install -Dm644 $src/OpenTabletDriver.UX/Assets/otd.png -t $out/share/pixmaps

		# Generate udev rules from source
		export OTD_CONFIGURATIONS="$src/OpenTabletDriver.Configurations/Configurations"

		mkdir -p $out/lib/udev/rules.d
		bash $src/generate-rules.sh \
			| sed 's@/usr/bin/env rm@${lib.getExe' coreutils "rm"}@' \
			> $out/lib/udev/rules.d/70-opentabletdriver.rules
	'';

	desktopItems = [
		(makeDesktopItem {
			desktopName = "OpenTabletDriver";
			name = "OpenTabletDriver";
			exec = "otd-gui";
			icon = "otd";
			comment = "Open source, cross-platform, user-mode tablet driver";
			categories = [ "Utility" ];
		})
	];
}
